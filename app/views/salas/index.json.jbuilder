json.array!(@salas) do |sala|
  json.extract! sala, :id, :nome, :numero, :andar
  json.url sala_url(sala, format: :json)
end
