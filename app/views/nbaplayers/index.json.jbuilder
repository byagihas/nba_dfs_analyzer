json.array!(@nbaplayers) do |nbaplayer|
  json.extract! nbaplayer, :name, :position, :team, :avgpoints, :cost
  json.url nbaplayer_url(nbaplayer, format: :json)
end
