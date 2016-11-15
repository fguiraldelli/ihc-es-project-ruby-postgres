class AddIdInstituicaoIdFacebookSexoNomeUsuarios < ActiveRecord::Migration
  def change
  	add_column :usuarios, :id_instituicao, :integer
  	add_column :usuarios, :id_facebook, :integer
  	add_column :usuarios, :sexo, :string
  	add_column :usuarios, :nome, :string
  end
end
