class Equipamento < ActiveRecord::Base
    has_many :historico_equipamentos
    belongs_to :sala
    belongs_to :tipo
    belongs_to :protocolo
    validates_presence_of :nome, :ip, :protocolo, :sala, :tipo
end
