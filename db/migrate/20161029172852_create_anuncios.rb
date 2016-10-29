class CreateAnuncios < ActiveRecord::Migration
  def change
    create_table :anuncios do |t|
      t.string :titulo
      t.text :descricao
      t.float :preco
      t.binary :imagem

      t.timestamps null: false
    end
  end
end
