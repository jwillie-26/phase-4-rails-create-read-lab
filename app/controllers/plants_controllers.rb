class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.new(plant_params)
    if plant.save
      render json: plant, status: :created, location: plant
    else
      render json: plant.errors, status: :unprocessable_entity
    end
  end

  private

  def plant_params
    params.permit(:name, :image, :price)
  end
end