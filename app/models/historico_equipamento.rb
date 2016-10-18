class HistoricoEquipamento < ActiveRecord::Base
    belongs_to :equipamento
    belongs_to :sala
end
