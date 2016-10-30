class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :token
      t.integer :positivo
      t.integer :negativo

      t.timestamps null: false
    end
  end
end
