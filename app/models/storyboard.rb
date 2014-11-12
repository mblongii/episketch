class Storyboard < ActiveRecord::Base
  has_many :sketches
  has_many :participants
  belongs_to :designer
  validates :name, presence: true
  validates :designer_id, presence: true
  after_save :add_designer_as_a_participant

private
  def add_designer_as_a_participant
    @participant = Participant.find_or_create_by(email: self.designer.email, storyboard_id: self.id)
    @participant.save
  end
end
