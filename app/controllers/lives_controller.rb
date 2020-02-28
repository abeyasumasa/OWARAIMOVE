class LivesController < ApplicationController
  before_action :set_live, only: [:show, :edit, :update, :destroy]

  def index
    @lives = Live.page(params[:page])
  end

  def new
    @live = Live.new
  end

  def create
    @live = Live.new(live_params)
    if @live.save
      comedian = current_user.comedians.first
      comedian.performer_managements.create(live_id:@live.id)
      binding.pry
      redirect_to lives_path, notice:"ライブを作成しました！"
    else
      reder :new
    end
  end

  def show
    @participant = current_user.participant_managements.find_by(live_id: @live.id)
  end

  def edit
  end

  def update
    if @live.update(live_params)
      redirect_to lives_path, notice: "ライブ情報を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @live.destroy
    redirect_to lives_path, notice:"ライブを削除しました！"
  end

  private

  def live_params
    params.require(:live).permit(:title, :content, :place, :date, :start_time, :ending_time, :price, :viewer)
  end

  def set_live
    @live = Live.find(params[:id])
  end

end
