class RacesController < ApplicationController 

  def index 
    @races = Race.all.order(created_at: :desc)
  end

  def show
    @race = Race.find(params[:id]) 
  end

  def new
    @race = Race.new
  end

  def create 
    race_params = permitted_params.merge(date: DateTime.parse(params.require(:race)[:date]))
    Race.create(race_params)
    redirect_to "/races"
  end

  def edit 
    @race = Race.find(params[:id])
  end

  def update 
    race = Race.find(params[:id])
    race.update(permitted_params)
    redirect_to '/races'
  end

  def destroy
    race = Race.find(params[:id])
    race.destroy
    redirect_to '/races'
  end

  private 

  def permitted_params 
    params.require(:race).permit(
      :name, 
      :location, 
      :kilometers, 
      :professional_racers_only
    )
  end
end