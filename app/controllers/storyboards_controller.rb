class StoryboardsController < ApplicationController
  wrap_parameters :storyboard, include: [:name, :email]
  # GET /storyboards
  # GET /storyboards.json
  def index
    @storyboards = Storyboard.all

    render json: @storyboards
  end

  # GET /storyboards/1
  # GET /storyboards/1.json
  def show
    @storyboard = Storyboard.find(params[:id])

    render json: @storyboard
  end

  # POST /storyboards
  # POST /storyboards.json
  def create
    # @storyboard = Storyboard.new(params[:storyboard])
    @storyboard = current_designer.storyboards.new(params.require(:storyboard).permit(:name))
    if @storyboard.save
      render json: @storyboard, status: :created, location: @storyboard
    else
      render json: @storyboard.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /storyboards/1
  # PATCH/PUT /storyboards/1.json
  def update
    @storyboard = Storyboard.find(params[:id])

    if @storyboard.update(params[:storyboard])
      head :no_content
    else
      render json: @storyboard.errors, status: :unprocessable_entity
    end
  end

  # DELETE /storyboards/1
  # DELETE /storyboards/1.json
  def destroy
    @storyboard = Storyboard.find(params[:id])
    @storyboard.destroy

    head :no_content
  end
end
