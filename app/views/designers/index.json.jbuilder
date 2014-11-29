json.array!(@designers) do |designer|
  json.extract! designer, :id, :email, :avatar_url, :auth_token, :storyboard_id, :viewing_storyboard_id
  json.url designer_url(designer, format: :json)
end
