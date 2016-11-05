json.extract! usuario, :id, :token, :positivo, :negativo, :meuspontos, :anuncios, :celular, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)