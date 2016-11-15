class CreateTermos < ActiveRecord::Migration
  def change
    create_table :termos do |t|
      t.string :termo

      t.timestamps null: false
    end
  end
end
