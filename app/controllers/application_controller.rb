class ApplicationController < ActionController::API
  before_filter :authenticate!

private
  def authenticate!
    @authenticated_user = Designer.find_by(auth_token: request.headers["Auth-Token"])
    render :json => { error: "Invalid token." }, 
        success: :false, status: :unauthorized unless @authenticated_user
  end

  def current_designer
    @authenticated_user
  end
end
