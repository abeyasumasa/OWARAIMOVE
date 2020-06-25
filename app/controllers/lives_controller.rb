class LivesController < ApplicationController
  before_action :set_live, only: [:show, :edit, :update, :destroy]
  before_action :encure_correct_performer, {only: [:edit, :update,:destroy]}

  def index
    @search = Live.ransack(params[:q])
    #現在日時より前のデータは表示しないように設定
    @lives = @search.result.where("date > ?", DateTime.now).reorder(:date).page(params[:page])
  end

  def new
    @live = Live.new
  end

  def create
    @live = Live.new(live_params)
    if @live.save
      comedian = current_user.comedian
      comedian.performer_managements.create(live_id: @live.id)
      flash[:success] = 'ライブを作成しました！'
      redirect_to lives_path
    else
      render :new
    end
  end

  def show
    if current_user != nil
      @participant = current_user.participant_managements.find_by(live_id: @live.id)
    end
  end

  def edit
  end

  def update
    if @live.update(live_params)
      flash[:success] = 'ライブ情報を編集しました！'
      redirect_to lives_path
    else
      render :edit
    end
  end

  def destroy
    @live.destroy
    flash[:success] = 'ライブを削除しました！'
    redirect_to lives_path
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
        flash[:danger] = "権限がありません"
        redirect_to lives_path
      end
    end
  end

end
