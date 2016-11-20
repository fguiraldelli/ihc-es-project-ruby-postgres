class Anuncio < ActiveRecord::Base

	def self.search(search)
		
		sqlwhere = ""

		arrtermos = search.split(' ')

		arrtermos.each { |elem| sqlwhere << "norm(titulo) LIKE norm('%#{elem}%') or norm(descricao) LIKE norm('%#{elem}%') or " }

		sqlwhere = sqlwhere[0...-3]

		sqlwhere = sqlwhere + " and negocio_fechado = false"

	 	where(sqlwhere)
	end

	def self.meusanuncios(token)
		#buscar o id_usuario em Usuarios pelo token
		id_usuario = Usuario.find_token(token).id

		where("id_usuario = ?", "#{id_usuario}") 
	end	

	# propriedade apenas leitura que retorna os pontos do anunciante
	def pontosanunciante

		Usuario.find(self.id_usuario).meuspontos

	end		

end
