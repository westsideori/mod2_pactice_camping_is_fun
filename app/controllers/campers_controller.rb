class CampersController < ApplicationController
  def index
    @campers = Camper.all
  end

  # get '/campers/:id'
  def show 
    @camper = Camper.find(params[:id])
  end 

  def new 
    @camper = Camper.new

    @campers = Camper.all
    @activities = Activity.all
  end 

  def create
    @camper = Camper.create(camper_params)
 
    if @camper.valid?
      redirect_to camper_path(@camper)
    else 
      flash[:my_errors] = @camper.errors.full_messages
      redirect_to new_camper_path
    end 
  end 

  # "/campers/:id"
  def destroy 
    camper = Camper.find(params[:id])
    camper.destroy 

    redirect_to campers_path
  end

  private 

  def camper_params
    params.require(:camper).permit(:age, :name)
  end 

end
