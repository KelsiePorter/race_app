class RacesController < ApplicationController 

  def index 
    @races = Race.all.order(created_at: :desc)
  end

  def show
    @race = Race.find(params[:id]) 
  end

  def new
  
  end

  def create 
    date = DateTime.parse(params[:date])
    race = Race.create(
      name: params[:name],
      date: date,
      location: params[:location],
      kilometers: params[:kilometers],
      professional_racers_only: params[:professional_racers_only]
    )
    redirect_to "/races"
  end
end