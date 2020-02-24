class LivesController < ApplicationController
  before_action :set_live, only: [:show, :edit, :update, :destroy]

  def index
    @lives = Live.all
  end

  def new
    @live = Live.new
  end

  def create
    @live = Live.new(live_params)
    if @live.save
      redirect_to lives_path, notice:"ライブを作成しました！"
    else
      reder :new
    end
  end

  def show
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
