class Usuario < ActiveRecord::Base

	def meuspontos
		@meuspontos = (self.positivo*100)/(self.positivo+self.negativo)

		if @meuspontos < 20 then
				@meuspontos = 1
		elsif @meuspontos >= 20 and @meuspontos < 40  
				@meuspontos = 2
		elsif @meuspontos >= 40 and @meuspontos < 60 
				@meuspontos = 3
		elsif @meuspontos >= 60 and @meuspontos < 80
			@meuspontos = 4
		elsif @meuspontos >= 80 
				@meuspontos = 5
		end		

	end	

	def self.search(token)
	  # Title is for the above case, the OP incorrectly had 'name'
	 	where("token LIKE ?", "%#{token}%")
	end

end
