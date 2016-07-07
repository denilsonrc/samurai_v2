class Equipamento < ActiveRecord::Base
    has_many :historico_equipamentos
    validates_presence_of :nome, :ip, :protocolo, :sala, :tipo
end
