class Equipamento < ActiveRecord::Base
    has_many :historico_equipamentos
    belongs_to :sala
    belongs_to :tipo
    belongs_to :protocolo
    belongs_to :equipamento
    validates_presence_of :nome, :ip, :protocolo, :sala
    validates_uniqueness_of :ip, :message=>"ja cadastrado"
end
