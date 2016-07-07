class CreateHistoricoEquipamentos < ActiveRecord::Migration
  def change
    create_table :historico_equipamentos do |t|
      t.string :status
      t.float :tempo
      t.string :dado
        
      t.belongs_to :equipamento, index: true, foreign_key: true
      t.belongs_to :sala, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
