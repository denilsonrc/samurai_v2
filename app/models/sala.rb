class Sala < ActiveRecord::Base
    has_many :equipamentos
    has_many :historico_equipamentos
    
    validates_presence_of :nome, :numero, :andar
end
