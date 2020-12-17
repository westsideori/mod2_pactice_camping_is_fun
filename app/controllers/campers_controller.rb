class CampersController < ApplicationController
  def index
    @campers = Camper.all
  end

  def show
    @camper = Camper.find(params[:id])
  end

  def new
    @camper = Camper.new
  end

  def create
    camper = Camper.create(camper_params)
    if camper.valid?
      redirect_to camper_path(camper)
    else
      flash[:errors_array] = camper.errors.full_messages
      redirect_to new_camper_path(camper)
    end
  end

  private

  def camper_params
    params.require(:camper).permit(:name, :age)
  end
  
end
