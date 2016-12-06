class Anuncio < ActiveRecord::Base

	def self.search(search)
		
		sqlwhere = ""

		arrtermos = search.split(' ')

		arrtermos.each { |elem| sqlwhere << "norm(titulo) LIKE norm('%#{elem}%') or norm(descricao) LIKE norm('%#{elem}%') or " }

		sqlwhere = sqlwhere[0...-3]

		sqlwhere = "( " + sqlwhere + " ) and negocio_fechado = false"

	 	where(sqlwhere)
	end

	def self.meusanuncios(token)

		id_usuario = Usuario.find_token(token).id

		where("id_usuario = ?", "#{id_usuario}") 
	end	

	# propriedade apenas leitura que retorna os pontos do anunciante
	def pontosanunciante

		Usuario.find(self.id_usuario).meuspontos

	end		

	# retorna os cinco anuncios mais visualizados
	def self.maispopulares(id_local)
		# falta implementar id_local criar campo e filtrar
		Anuncio.order('visualizacoes DESC').first(5) 

	end	


	def tempoanuncio

		resultado = ""
		
		temposegundos = (Time.now - self.created_at).to_i

		if temposegundos < 60 then

			resultado = "agora"
		else	

			anos = temposegundos / (60*60*24*30*12)
			temposegundos -= anos * (60*60*24*30*12)

			meses = temposegundos / 1.months
			temposegundos -= meses / 1.months

			dias = temposegundos / 1.days
			temposegundos -= dias * 1.days

			horas = temposegundos / 1.hours
			temposegundos -= horas * 1.hours

			minutos = temposegundos / 1.minutes
			temposegundos -= minutos * 1.minutes
		
			if anos > 0 then resultado += "#{anos}a " end
			if meses > 0 then resultado += "#{meses}m " end
			if dias > 0 then resultado += "#{dias}d " end
			if horas > 0 then resultado += "#{horas}h " end
			if minutos > 0 then resultado += "#{minutos}min" end

		end

		tempoanuncio = resultado
	end

end
