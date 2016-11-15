json.extract! anuncio, :id, :titulo, :descricao, :preco, :imagem, :token, :negocio_fechado, :meuspontos, :created_at, :updated_at
json.url anuncio_url(anuncio, format: :json)