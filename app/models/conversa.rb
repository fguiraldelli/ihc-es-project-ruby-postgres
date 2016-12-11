class Conversa < ActiveRecord::Base

	def nome_usuario_remetente

		Usuario.find(self.id_usuario_remetente).nome

	end
		

end
