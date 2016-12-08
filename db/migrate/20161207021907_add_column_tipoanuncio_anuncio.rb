class AddColumnTipoanuncioAnuncio < ActiveRecord::Migration
  def change
  	add_column :anuncios, :tipoanuncio, :string, :limit => 1
  end
end
