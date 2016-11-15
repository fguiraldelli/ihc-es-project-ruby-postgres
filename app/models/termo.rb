class Termo < ActiveRecord::Base

	def self.buscartermos(termo)
	   	where("termo LIKE ?", "%#{termo}%") 
	end

end
