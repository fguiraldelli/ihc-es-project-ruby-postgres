class Anuncio < ActiveRecord::Base

	def self.search(search)
	  # Title is for the above case, the OP incorrectly had 'name'
	 	where("titulo LIKE ?", "%#{search}%")
	end

	def self.myadvertise(token)
		where("token LIKE ?", "%#{token}%") 
	end	

end
