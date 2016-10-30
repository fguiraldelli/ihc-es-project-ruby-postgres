class AddColumnTokenAnuncio < ActiveRecord::Migration
  def change
  	add_column :anuncios, :token, :string
  end

end
