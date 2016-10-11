class HistoricoEquipamento < ActiveRecord::Base
	belongs_to :sala
	belongs_to :equipamento
end
