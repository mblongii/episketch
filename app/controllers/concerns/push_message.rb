module PushMessage
  extend ActiveSupport::Concern
  include PushServer

  def push_message(channel,viewer)
    HTTParty.get("http://#{push_server_uri}/#{channel}?email=#{viewer.email}&avatar_url=#{viewer.avatar_url}")
  end
end
