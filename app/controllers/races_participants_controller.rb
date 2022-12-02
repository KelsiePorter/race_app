class RacesParticipantsController < ApplicationController 
  def index 
    @race = Race.find(params[:id])
    @race_participants = @race.participants
  end
end