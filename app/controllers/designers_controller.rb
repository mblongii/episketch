class DesignersController < ApplicationController

  wrap_parameters :designer, include: [:email]
  skip_before_filter :authenticate!, only: [:create]

  # GET /designers
  # GET /designers.json
  def index
    @designers = Designer.all

    render json: @designers
  end

  # GET /designers/1
  # GET /designers/1.json
  def show
    @designer = Designer.find(params[:id])

    render json: @designer
  end

  # POST /designers
  # POST /designers.json
  def create
    @designer = Designer.new(params.require(:designer).permit(:email))

    if @designer.save
      head status: :created, location: @designer, auth_token: @designer.auth_token
    else
     render json: @designer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /designers/1
  # PATCH/PUT /designers/1.json
  def update
    @designer = Designer.find(params[:id])

    if @designer.update(params[:designer])
      head :no_content
    else
      render json: @designer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /designers/1
  # DELETE /designers/1.json
  def destroy
    @designer = Designer.find(params[:id])
    @designer.destroy

    head :no_content
  end
end
