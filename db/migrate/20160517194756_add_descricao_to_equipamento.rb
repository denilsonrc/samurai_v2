class AddDescricaoToEquipamento < ActiveRecord::Migration
  def change
  	add_column :equipamentos, :descricao, :text
  	add_column :equipamentos, :protocolo, :string
  end
end
