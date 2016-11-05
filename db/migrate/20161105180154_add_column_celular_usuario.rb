class AddColumnCelularUsuario < ActiveRecord::Migration
  def change
  	add_column :usuarios, :celular, :string
  end
end
