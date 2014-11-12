class DesignersController < ApplicationController
  include Storyboards

  wrap_parameters :designer, include: [:email, :avatar_url]
  skip_before_filter :authenticate!, only: [:create]
  before_filter :find, only: [:show, :update]

  def find
    @designer = Designer.find(params[:id])
  end

  # GET /designers
  def index
    @designers = []
    storyboards.each {|s|
      s.participants.each {|p|
        @designers << Designer.where(email: p.email)
      }
    }
    render json: @designers, except: [:auth_token]
  end

  # GET /designers/1
  def show
    render json: @designer, except: [:auth_token, :storyboard_id, :viewing_storyboard_id]
  end

  # POST /designers
  def create
    @designer = Designer.new(params.require(:designer).permit([:email, :avatar_url]))
    if @designer.save
      head status: :created, location: @designer, auth_token: @designer.auth_token
    else
      render json: @designer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /designers/1
  def update
    if current_designer.id == @designer.id # prevent users from modifying each others settings (e.g., email and/or avatar)
      if @designer.update(params[:designer])
        head :no_content
      else
        render json: @designer.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /designers/1
  def destroy
    # @designer.destroy
    head :no_content
  end
end
