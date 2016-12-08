class AddColumnDiassemanaAnuncio < ActiveRecord::Migration
  def change
  	add_column :anuncios, :diassemana, :string, :limit => 7
  end
end
