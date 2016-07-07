class Protocolo < ActiveRecord::Base
    has_many :equipamentos
    
    validates_presence_of :nome
end
