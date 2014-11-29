class Designer < ActiveResource::Base
  self.site = "#{ENV['BASE_URI']}"
  attr_accessor :email, :avatar_url, :auth_token
end
