module Storyboards
  extend ActiveSupport::Concern

  # Returns only those storyboards that the designer created
  # or was invited to participate in
  def storyboards
    @storyboards = []
    # Find the storyboards they created
    current_designer.storyboards.each {|s|
      @storyboards << s
    }
    # Find the storyboards where they are a participant
    Participant.where(email: current_designer.email).each {|p|
      Storyboard.where(id: p.storyboard_id).each {|s|
        @storyboards << s
      }
    }
    return @storyboards.uniq
  end
end
