class RaceParticipantsController < ApplicationController 
  def index 
    @race = Race.find(params[:id])
    if params[:sorted]
      @race_participants = @race.racers_sorted_by_last_name
    elsif params[:age_threshold]
      @race_participants = @race.racers_over_age(params[:age_threshold])
    else
      @race_participants = @race.participants
    end
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