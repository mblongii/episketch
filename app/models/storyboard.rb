class Storyboard < ActiveResource::Base
  self.site = "#{ENV['BASE_URI']}"
  attr_accessor :name
end
