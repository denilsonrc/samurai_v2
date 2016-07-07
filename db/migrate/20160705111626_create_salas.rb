class CreateSalas < ActiveRecord::Migration
  def change
    create_table :salas do |t|
      t.string :nome
      t.string :numero
      t.string :andar

      t.timestamps null: false
    end
  end
end
