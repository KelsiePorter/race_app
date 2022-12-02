class RacesController < ApplicationController 

  def index 
    @races = Race.all.order(created_at: :desc)
  end

  def show
    @race = Race.find(params[:id]) 
  end
end