class Designer
  include ActiveModel::Model
  attr_accessor :email, :avatar_url, :auth_token

  def save
    @email = self.email
    HTTParty.post("#{ENV['BASE_URI']}/designers", 
      body: {email: @email}.to_json, 
      headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' })
  end
end
