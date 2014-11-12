class StoryboardsController < ApplicationController
  include StoryboardParticipants
  include Storyboards

  wrap_parameters :storyboard, include: [:name, :email]
  before_filter :find, only: [:show, :update, :invite, :get_participants]

  def find
    @storyboard = Storyboard.find(params[:id])
  end

  # GET /storyboards
  def index
    @storyboards = storyboards
    render json: @storyboards
  end

  # GET /storyboards/1
  def show
    render json: @storyboard
  end

  # POST /storyboards
  def create
    @storyboard = current_designer.storyboards.new(params.require(:storyboard).permit([:name, :designer_id]))
    if @storyboard.save
      render json: @storyboard, status: :created, location: @storyboard
    else
      render json: @storyboard.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /storyboards/1
  def update
    if @storyboard.update(params[:storyboard])
      head :no_content
    else
      render json: @storyboard.errors, status: :unprocessable_entity
    end
  end

  # DELETE /storyboards/1
  def destroy
    head :no_content
  end
end
