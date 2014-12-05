module StoryboardViewers
  extend ActiveSupport::Concern
  include PushMessage

  # PATCH/PUT /storyboards/1/viewer
  def set_viewer
    @designer = Designer.find_by(auth_token: request.headers["Auth-Token"])
    @designer.viewing_storyboard_id = @storyboard.id
    @designer.save
    push_message('viewers', @designer)
  end

  # GET /storyboards/1/viewers
  def get_viewers
    @designers = Designer.where(viewing_storyboard_id: @storyboard.id)
    @viewing = []
    @designers.each {|v| @viewing << v }
    render :json => { viewers: @viewing }, except: [:auth_token, :storyboard_id]
  end
end
