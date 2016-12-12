class UpdateTipoanuncioAnuncios < ActiveRecord::Migration
  def change

  	sql = "UPDATE ANUNCIOS SET TIPOANUNCIOS = 'c' WHERE TIPOANUNCIOS = '';"
 
  	ActiveRecord::Base.connection.execute(sql)

  end
end
