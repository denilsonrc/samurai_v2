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
  dado_snmp = "Sem registro"
  Equipamento.all.map { |e|
    if e.protocolo.nome == "PING"
      tmp = Time.now
    	if ping(e.ip)
    		status="ligado"
    	else
    		status="desligado"
    	end
      tmp_resp = ((Time.now - tmp) * 1000).round(4)
    elsif e.protocolo.nome == "SNMP"
      tmp = Time.now
      puts e.protocolo.nome
      SNMP::Manager.open(:host => e.ip) do |manager|
        response = manager.get(["sysDescr.0", "sysName.0"])
        response.each_varbind do |vb|
          dado_snmp = vb.value.to_s
        end
      end
      tmp_resp = ((Time.now - tmp) * 1000).round(4)
    end 
  	if e.protocolo.nome == "SNMP"
      HistoricoEquipamento.create(:equipamento_id=>e.id,:sala_id=>e.sala_id,:dado=>dado_snmp,:tempo=>tmp_resp)
    else
      HistoricoEquipamento.create(:equipamento_id=>e.id,:status=>status, :sala_id=>e.sala_id, :tempo=>tmp_resp)
    end
  }
  sleep 30
end