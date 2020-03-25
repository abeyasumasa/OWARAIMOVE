class LivesController < ApplicationController
  before_action :set_live, only: [:show, :edit, :update, :destroy]
  before_action :encure_correct_performer, {only: [:edit, :update,:destroy]}

  def index
    @search = Live.ransack(params[:q])
    @lives = @search.result.page(params[:page])
    # .list(params)
    # @comedian = Live.performer_management_comedians
  end

  def new
    @live = Live.new
  end

  def create
    @live = Live.new(live_params)
    if @live.save
      comedian = current_user.comedian
      comedian.performer_managements.create(live_id: @live.id)
      redirect_to lives_path, notice: "ライブを作成しました！"
    else
      render :new
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
    redirect_to lives_path, notice: "ライブを削除しました！"
  end

  private

  def live_params
    params.require(:live).permit(:title, :content, :place, :date, :start_time, :ending_time, :price, :viewer)
  end

  def set_live
    @live = Live.find(params[:id])
  end

  def encure_correct_performer
    @comedian = @live.performer_management_comedians
    @comedian.each do |comedian|
      if current_user.comedian.id != comedian.id
        flash[:notice] = "権限がありません"
        redirect_to lives_path
      end
    end
  end

end
