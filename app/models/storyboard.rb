class Storyboard < ActiveRecord::Base
  belongs_to :designer
  validates :name, presence: true
  validates :designer_id, presence: true  
end
