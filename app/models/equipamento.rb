class Equipamento < ActiveRecord::Base
  belongs_to :sala
  belongs_to :tipo
  has_many :historico_equipamentos
  
  validates_presence_of :nome, :ip, :protocolo, :sala, :tipo 

  def status_por_numero_de_registro(status)
  	numero_de_registro = HistoricoEquipamento.where(:equipamento_id=>self.id,:status=>status).count
  	return numero_de_registro
  end
end
