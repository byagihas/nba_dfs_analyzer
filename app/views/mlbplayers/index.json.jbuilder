json.array!(@mlbplayers) do |mlbplayer|
  json.extract! mlbplayer, :id, :name, :team, :position, :battingpos, :salary, :avgpoints, :value
  json.url mlbplayer_url(mlbplayer, format: :json)
end
