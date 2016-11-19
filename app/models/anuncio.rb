class Anuncio < ActiveRecord::Base

	def self.search(search)

	 	where("(upper(titulo) LIKE upper(?) or upper(descricao) LIKE upper(?)) and negocio_fechado = false ", "%#{search}%", "%#{search}%")
	end

	def self.meusanuncios(token)
		where("token LIKE ?", "%#{token}%") 
	end	

	# propriedade apenas leitura que retorna os pontos do anunciante
	def pontos_anunciante
	
		if !self.token.nil? then Usuario.find_token(self.token).meuspontos end

	end		

end
