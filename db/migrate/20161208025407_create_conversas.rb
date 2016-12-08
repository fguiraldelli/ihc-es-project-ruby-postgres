class CreateConversas < ActiveRecord::Migration
  def change
    create_table :conversas do |t|
      t.integer :id_usuario_anuncio
      t.integer :id_usuario_interessado
      t.string :mensagem

      t.timestamps null: false
    end
  end
end
