json.extract! usuario, :id, :token, :positivo, :negativo, :meuspontos, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)