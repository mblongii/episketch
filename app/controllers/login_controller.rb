class LoginController < ApplicationController
  skip_before_filter :authenticate!, :only => [:create, :new]

  # GET /login
  def new
    head status: :no_content
  end

  # POST /login
  def create
    @designer = Designer.find_or_create_by(email: params[:email])
    if @designer
      head location: @designer, auth_token: @designer.auth_token
    else
      render json: @designer.errors, status: :unprocessable_entity,
        success: :false, status: :unauthorized
    end
  end

  # DELETE /logout
  def destroy
    head status: :accepted
  end
end
