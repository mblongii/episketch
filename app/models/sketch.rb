class Sketch < ActiveRecord::Base
  belongs_to :designer
  belongs_to :storyboard
  validates :designer_id, presence: true
  validates :storyboard_id, presence: true
  validates :url, presence: true
end
