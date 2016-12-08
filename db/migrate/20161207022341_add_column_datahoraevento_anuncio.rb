class AddColumnDatahoraeventoAnuncio < ActiveRecord::Migration
  def change
  	add_column :anuncios, :datahoraevento, :datetime

  end
end
