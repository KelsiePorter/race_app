class RacesParticipantsController < ApplicationController 
  def index 
    @race = Race.find(params[:id])
    @race_participants = @race.participants
  end

  def new 
    @race = Race.find(params[:id])
  end

  def create
    race = Race.find(params[:id])
    Participant.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      professional_racer: params[:professional_racer],
      age: params[:age],
      race_id: race.id
    ) 
    redirect_to "/races/#{race.id}/participants"
  end
end