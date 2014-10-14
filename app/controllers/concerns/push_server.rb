module PushServer
  extend ActiveSupport::Concern

  def push_server_uri
    if Rails.env.development? 
      return ENV['PUSH_DEV']
    end
    if Rails.env.production? ENV['PUSH_PROD']
      return ENV['PUSH_PROD']
    end
  end
end
