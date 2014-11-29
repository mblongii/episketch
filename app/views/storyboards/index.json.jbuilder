json.array!(@storyboards) do |storyboard|
  json.extract! storyboard, :id, :designer_id, :name
  json.url storyboard_url(storyboard, format: :json)
end
