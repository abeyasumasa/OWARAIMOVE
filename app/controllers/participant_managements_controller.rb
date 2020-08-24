class ParticipantManagementsController < ApplicationController
  def create
    participant = current_user.participant_managements.create(live_id: params[:live_id])
    redirect_to lives_url, notice: "#{participant.live.title}に参加しました"
  end
  
  def destroy
    participant = current_user.participant_managements.find_by(id: params[:id]).destroy
    redirect_to lives_url, notice: "#{participant.live.title}への参加をキャンセルしました"
  end
end
