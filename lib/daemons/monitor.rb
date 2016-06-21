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
  Equipamento.all.map { |e|
    if e.protocolo == "PING"
      tmp = Time.now
    	if ping(e.ip)
    		status="ligado"
    	else
    		status="desligado"
    	end
      tmp_resp = ((Time.now - tmp) * 1000).round(4)
    elsif e.protocolo == "SNMP"
      
    end  
  	HistoricoEquipamento.create(:equipamento_id=>e.id,:status=>status, :sala_id=>e.sala_id, :tempo=>tmp_resp)
  }
  sleep 30
end