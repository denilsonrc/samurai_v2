require 'timeout'
require 'socket'
#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "development"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
Dir.chdir(root)

require File.join(root, "config", "environment")

$running = true
Signal.trap("TERM") do 
  $running = false
end

def ping(host)
  begin
    Timeout.timeout(5) do 
      s = TCPSocket.new(host, 'echo')
      s.close
      return true
    end
  rescue Errno::ECONNREFUSED 
    return true
  rescue Timeout::Error, Errno::ENETUNREACH, Errno::EHOSTUNREACH
    return false
  end
end

while($running) do
  Equipamento.where(:equipamento_id=>nil).map { |e|
    if e.protocolo.nome == "PING"
      tmp = Time.now
    	if ping(e.ip)
    		status="ligado"
    	else
    		status="desligado"
    	end
      tmp_resp = ((Time.now - tmp) * 1000).round(4)
      HistoricoEquipamento.create(:equipamento_id=>e.id,:status=>status, :sala_id=>e.sala_id, :tempo=>tmp_resp)
    elsif e.protocolo.nome == "SNMP"
      ifTableColumns = ["1.3.6.1.2.1.99.1.1.1.9", "1.3.6.1.2.1.99.1.1.1.5", "1.3.6.1.2.1.99.1.1.1.4"]
      tmp = Time.now
      puts e.protocolo.nome
      SNMP::Manager.open(:host => e.ip) do |manager|
        manager.walk(ifTableColumns) do |dados|
          aux = []
          dados.each { |vb| 
            aux << "#{vb.value}" 
          }
          if aux[1] == "0"
            status = "Desligado"
          elsif aux[1] == "1"
            status = "Ativo"
          else
            status = "Sem registro"
          end
          tmp_resp = ((Time.now - tmp) * 1000).round(4)
          equipamento = Equipamento.where(ip: aux[0]).first
          equipamento.update(:status=>status)
          HistoricoEquipamento.create(:equipamento_id=>equipamento.id,:status=>status,:sala_id=>equipamento.sala_id,:dado=>aux[2],:tempo=>tmp_resp)
        end
      end
    end 
  }
  sleep 30
end