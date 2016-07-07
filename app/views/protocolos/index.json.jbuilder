json.array!(@protocolos) do |protocolo|
  json.extract! protocolo, :id, :nome
  json.url protocolo_url(protocolo, format: :json)
end
