json.array!(@nbaplayers) do |nbaplayer|
<<<<<<< HEAD
  json.extract! nbaplayer, :id, :name, :position, :team, :avgpoints, :cost
=======
  json.extract! nbaplayer, :id, :name, :position, :team, :avgpoints, :is_starting_lineup
>>>>>>> 3083326312dc6908e454a7122e912b7f0a314b7b
  json.url nbaplayer_url(nbaplayer, format: :json)
end
