class AddColumnNegocioFechadoAnuncio < ActiveRecord::Migration
  def change
  	add_column :anuncios, :negocio_fechado, :boolean
  end
end
