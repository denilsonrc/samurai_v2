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
  Equipamento.where(:equipamento_id=>nil).map{|e|
    ifTableColumns = ["1.3.6.1.2.1.99.1.1.1.10", "1.3.6.1.2.1.99.1.1.1.9", "1.3.6.1.2.1.99.1.1.1.5", "1.3.6.1.2.1.99.1.1.1.13", "1.3.6.1.2.1.99.1.1.1.14", "1.3.6.1.2.1.99.1.1.1.1"]
    SNMP::Manager.open(:host => e.ip) do |manager|
      manager.walk(ifTableColumns) do |dados|
        aux = []
        dados.each { |vb| 
          aux << "#{vb.value}" 
        }
        begin
          sala = Sala.where(:nome=>aux[4]).first
          if aux[2] == 0
            status = "Desligado"
          elsif aux[2] == 1
            status = "Ativo"
          else
            status = "Sem registro"
          end
          tipo = Tipo.find(aux[5])
          Equipamento.create(:nome=>aux[0],:ip=>aux[1],:status=>status,:descricao=>aux[3],:computador_id=>e.id,:sala_id=>sala.id,:protocolo_id=>2,:tipo_id=>tipo.id)
        rescue
        end
      end
    end
  }
end

#type "1.3.6.1.2.1.99.1.1.1.1.1"
#Scale "1.3.6.1.2.1.99.1.1.1.2.1"
#Precision "1.3.6.1.2.1.99.1.1.1.3.1"
#Value "1.3.6.1.2.1.99.1.1.1.4.1"
#OperStatus "1.3.6.1.2.1.99.1.1.1.5.1"
#UnitsDisplay "1.3.6.1.2.1.99.1.1.1.6.1"
#ValueTimesTamp "1.3.6.1.2.1.99.1.1.1.7.1"
#ValueUpdateRate "1.3.6.1.2.1.99.1.1.1.8.1"
#IPv6LocalAddr "1.3.6.1.2.1.99.1.1.1.9.1"
#Name "1.3.6.1.2.1.99.1.1.1.10.1"
#Function "1.3.6.1.2.1.99.1.1.1.11.1"
#Pin "1.3.6.1.2.1.99.1.1.1.12.1"
#Description "1.3.6.1.2.1.99.1.1.1.13.1"
#Location "1.3.6.1.2.1.99.1.1.1.14.1"

#mudar ultimo numero referente a linha da tabela