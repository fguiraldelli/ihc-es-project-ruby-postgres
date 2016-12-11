json.extract! conversa, :id, :id_anuncio, :id_usuario_remetente, :nome_usuario_remetente, :mensagem, :created_at, :updated_at
json.url conversa_url(conversa, format: :json)