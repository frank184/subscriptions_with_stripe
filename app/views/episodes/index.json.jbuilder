json.array!(@episodes) do |episode|
  json.extract! episode, :id, :name, :description
  json.url episode_url(episode, format: :json)
end
