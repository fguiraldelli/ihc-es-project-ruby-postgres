class ChangedDataVisualizacoesAnuncio < ActiveRecord::Migration
  def change

  	sql = "UPDATE ANUNCIOS SET VISUALIZACOES = 0;"
 
  	ActiveRecord::Base.connection.execute(sql)

  end
end
