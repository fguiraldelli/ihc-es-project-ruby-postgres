class Termo < ActiveRecord::Base

	def self.buscartermos(termo)
	   	where("termo LIKE ?", "%#{termo}%") 
	end

	def self.gravartermo(frase)
		# salva a frase inteira
		gravarpalavra(frase)

		#salva as palavras da frase separadamente
		frase.split(' ').each do |elem|
			gravarpalavra(elem)
		end
	end	

	def self.gravarpalavra(palavra)

		# pesquisa a palavra no bd antes de salvar
		if Termo.where("norm(termo) = norm(?)", "#{palavra}").count < 1
			Termo.new(:termo => palavra.downcase).save
		end

	end	

end
