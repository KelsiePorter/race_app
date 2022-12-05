class ParticipantsController < ApplicationController
   def index 
    @participants = Participant.all
   end

   def show 
    @participant = Participant.find(params[:id])
   end

   def edit
    @participant = Participant.find(params[:id])
   end

   def update
    participant = Participant.find(params[:id])
    participant.update(permitted_params)
    redirect_to '/participants'
   end

   private

   def permitted_params
    params.require(:participant).permit(
      :first_name,
      :last_name,
      :professional_racer,
      :age
    )
   end
end