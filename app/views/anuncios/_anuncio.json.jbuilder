json.extract! anuncio, :id, :titulo, :descricao, :preco, :imagem, :token, :negocio_fechado, :pontosanunciante, :id_usuario,:created_at, :updated_at
json.url anuncio_url(anuncio, format: :json)