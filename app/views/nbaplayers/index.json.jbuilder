json.array!(@nbaplayers) do |nbaplayer|
  json.extract! nbaplayer, :id, :name, :position, :team, :avgfanduelpoints, :is_starting_lineup
  json.url nbaplayer_url(nbaplayer, format: :json)
end
