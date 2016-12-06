class AddColumnVisualizacoesAnuncio < ActiveRecord::Migration
  def change
	add_column :anuncios, :visualizacoes, :integer
  end
end
