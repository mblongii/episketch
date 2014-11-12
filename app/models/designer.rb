class Designer < ActiveRecord::Base
  include ValidateEmail
  has_many :storyboards
  has_many :sketches
  before_create :generate_auth_token
  validates :email, presence: true, uniqueness: true, email: true

private
  def generate_auth_token
    begin
      self.auth_token = SecureRandom.hex
    end while self.class.exists?(auth_token: auth_token)
  end
end
