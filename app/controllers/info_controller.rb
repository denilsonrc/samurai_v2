class InfoController < ApplicationController
  def index
    @grafico_pizza = Hash[Tipo.all.map do |t|
      [t.nome, t.equipamentos.count]
    end]
    @grafico_barras = Hash[Sala.all.map { |s| 
      numero = s.historico_equipamentos.count
    	[s.nome, numero]
    }]
  end
  def grade_equipamentos
    @equipamentos = Equipamento.all
  end
end

