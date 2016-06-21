class Sala < ActiveRecord::Base
	has_many :equipamentos
	has_many :historico_equipamentos
end
