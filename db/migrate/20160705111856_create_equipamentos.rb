class CreateEquipamentos < ActiveRecord::Migration
  def change
    create_table :equipamentos do |t|
      t.string :nome
      t.string :ip
      t.string :status
      t.string :no
      t.text :descricao
      
      t.belongs_to :sala, index: true, foreign_key: true
      t.belongs_to :tipo, index: true, foreign_key: true
      t.belongs_to :protocolo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
