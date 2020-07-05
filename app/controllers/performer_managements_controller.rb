class PerformerManagementsController < ApplicationController
  def create
    performer = current_user.comedian.performer_managements.create(live_id: params[:live_id])
    redirect_to lives_url, notice: "#{performer.live.title}に参加しました"
  end
  def destroy
    performer = current_user.comedian.performer_managements.find_by(live_id: params[:id]).destroy
    redirect_to lives_url, notice: "#{performer.live.title}への参加をキャンセルしました"
  end
end
