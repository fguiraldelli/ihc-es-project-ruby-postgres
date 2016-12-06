class AddColumnImagensAnuncio < ActiveRecord::Migration
  def change
		add_column :anuncios, :imagem2, :binary
		add_column :anuncios, :imagem3, :binary
		add_column :anuncios, :imagem4, :binary
		add_column :anuncios, :imagem5, :binary

  end
end
