class Participant < ActiveRecord::Base
  include ValidateEmail
  belongs_to :storyboard
  validates :email, presence: true, email: true
  validates :storyboard_id, presence: true
  after_save :find_or_create_designer

private
  def find_or_create_designer
    @designer = Designer.find_or_create_by(email: self.email)
  end
end
