json.array!(@historico_equipamentos) do |historico_equipamento|
  json.extract! historico_equipamento, :id, :status, :tempo, :dado
  json.url historico_equipamento_url(historico_equipamento, format: :json)
end
