class CreateEquipamentos < ActiveRecord::Migration
  def change
    create_table :equipamentos do |t|
      t.string :nome
      t.string :mac
      t.string :ip
      t.string :status
      t.belongs_to :sala, index: true, foreign_key: true
      t.belongs_to :tipo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
