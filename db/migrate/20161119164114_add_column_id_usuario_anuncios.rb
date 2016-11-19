class AddColumnIdUsuarioAnuncios < ActiveRecord::Migration
  def change
  	add_column :anuncios, :id_usuario, :integer
  end
end
