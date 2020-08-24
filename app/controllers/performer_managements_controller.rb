class PerformerManagementsController < ApplicationController
  def create
    performer = current_user.comedian.performer_managements.create(live_id: params[:live_id])
    redirect_to lives_url, notice: "#{performer.live.title}に出演しました"
  end

  def destroy
    performer = current_user.comedian.performer_managements.find_by(id: params[:id])

    if performer.destroy
      redirect_to lives_url, notice: "#{performer.live.title}への出演をキャンセルしました"
    else
      redirect_to lives_url, notice: "ライブに出演している芸人を１人以下にはできません。ライブがなくなった場合はライブ削除を選択してください"
    end
  end
end
