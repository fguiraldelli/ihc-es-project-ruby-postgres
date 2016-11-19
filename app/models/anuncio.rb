class Anuncio < ActiveRecord::Base

	def self.search(search)
		#quebrar os search em varios termos e gerar 
		sql = "(upper(titulo) LIKE upper(?) or upper(descricao) LIKE upper(?)) and negocio_fechado = false " 

	 	where("(upper(titulo) LIKE upper(?) or upper(descricao) LIKE upper(?)) and negocio_fechado = false", "%#{search}%", "%#{search}%")
	end

	def self.meusanuncios(token)
		#buscar o id_usuario em Usuarios pelo token
		id_usuario = Usuario.find_token(token).id

		where("id_usuario = ?", "#{id_usuario}") 
	end	

	# propriedade apenas leitura que retorna os pontos do anunciante
	def pontosanunciante
		
		resultado = 3

		if !self.token.nil? then 

			@usuario = Usuario.find_token(self.token)

			if !@usuario.nil? then	resultado = @usuario.meuspontos end
		end

	end		

end
