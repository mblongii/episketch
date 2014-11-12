class SketchesController < ApplicationController
  wrap_parameters :sketch, include: [:url, :storyboard_id]
  before_filter :find, only: [:show, :update]

  def find
    @sketch = Sketch.find(params[:id])
  end

  # GET /sketches
  def index
    @sketches = current_designer.sketches
    render json: @sketches
  end

  # GET /sketches/1
  def show
    render json: @sketch
  end

  # POST /sketches
  def create
    @sketch = current_designer.sketches.new(params.require(:sketch).permit([:url, :designer_id, :storyboard_id]))
    if @sketch.save
      render json: @sketch, status: :created, location: @sketch
    else
      render json: @sketch.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sketches/1
  def update
    if @sketch.update(params[:sketch])
      head :no_content
    else
      render json: @sketch.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sketches/1
  def destroy
    # @sketch.destroy
    head :no_content
  end
end
