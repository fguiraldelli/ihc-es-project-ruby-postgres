json.extract! anuncio, :id, :titulo, :descricao, :preco, :imagem, :token, :negocio_fechado, :pontos_anunciante, :created_at, :updated_at
json.url anuncio_url(anuncio, format: :json)