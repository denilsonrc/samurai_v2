json.array!(@equipamentos) do |equipamento|
  json.extract! equipamento, :id, :nome, :mac, :ip, :status, :sala_id, :tipo_id
  json.url equipamento_url(equipamento, format: :json)
end
