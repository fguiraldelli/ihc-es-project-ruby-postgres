class Anuncio < ActiveRecord::Base

	def self.search(search)
	  # Title is for the above case, the OP incorrectly had 'name'
	  # resolver problema de case e acento no collate do banco de dados	  
	  # resolver problema de mais de um termo na busca

	 	where("(upper(titulo) LIKE upper(?) or upper(descricao) LIKE upper(?)) and negocio_fechado = false ", "%#{search}%", "%#{search}%")
	end

	def self.meusanuncios(token)
		where("token LIKE ?", "%#{token}%") 
	end	

	# propriedade apenas leitura que retorna os pontos do anunciante
	def meuspontos
		Usuario.find_token(self.token).meuspontos
	end	

end
