class ChangeColumnNameConversas < ActiveRecord::Migration
  def change
	rename_column :conversas, :id_usuario_anuncio, :id_anuncio
	rename_column :conversas, :id_usuario_interessado, :id_usuario_remetente
  end
end
