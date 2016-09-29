#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "production"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
Dir.chdir(root)

require File.join(root, "config", "environment")

$running = true
Signal.trap("TERM") do 
  $running = false
end

while($running) do
  
  Equipamento.where(:equipamento=>nil).map{|e|
    ifTableColumns = ["entPhySensorName.#{count}", "entPhySensorIPv6LocalAddr.#{count}", "entPhySensorOperStatus.#{count}", "entPhySensorDescription.#{count}"]
    SNMP::Manager.open(:host => e.ip) do |manager|
      manager.walk(["entPhySensorName", "entPhySensorIPv6", "entPhySensorOperStatus", "entPhySensorFunction"]) do |nome, ip, status, descricao|
        if status == "ok"
          status = "ativo"
        end
        Equipamento.create(:nome=>nome,:ip=>ip,:status=>status,:descricao=>descricao,:equipamento=>e)
      end
    end
  }
  
  sleep 10
end
