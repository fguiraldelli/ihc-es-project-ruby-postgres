class AdministracaoController < ActionController::Base
 
  def atualizarusuarios

    @usuarios = Usuario.where("token is null")

    registrosdeletados = @usuarios.count
    @usuarios.destroy_all 
    
    render text: registrosdeletados.to_json
  end

  def atualizaranuncios

  end


end