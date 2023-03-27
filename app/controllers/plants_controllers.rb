class PlantsController < ApplicationController
  def index
      plants = Plant.all
      render json: plants
  end
  def show
      plant = Plant.find_by(id:params[:id])
      if plant
        render json: plant
       else
        render json: { error: "plants  not found" }, status: :not_found
       end
  end
  def create
      plant =  Plant.create(plant_params)
      if plant.valid?
      render json: plant, status: :created
      else 
          render json: {error:plant.errors.full_messages }, status: :unprocessable_entity
      end

  end
  def plant_params
      params.permit(:name, :image, :price)
  end
end