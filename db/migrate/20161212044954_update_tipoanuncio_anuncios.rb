class UpdateTipoanuncioAnuncios < ActiveRecord::Migration
  def change

  	sql = "UPDATE ANUNCIOS SET TIPOANUNCIO = 'c' WHERE TIPOANUNCIO = '';"
 
  	ActiveRecord::Base.connection.execute(sql)

  end
end
