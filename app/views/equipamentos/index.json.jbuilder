json.array!(@equipamentos) do |equipamento|
  json.extract! equipamento, :id, :nome, :ip, :status, :descricao
  json.url equipamento_url(equipamento, format: :json)
end
