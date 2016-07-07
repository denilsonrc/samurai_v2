class CreateProtocolos < ActiveRecord::Migration
  def change
    create_table :protocolos do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
