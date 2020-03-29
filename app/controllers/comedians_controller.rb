class ComediansController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_comedian, only: [:show, :edit, :update, :destroy]
  before_action :encure_correct_entertainer, {only: [:edit, :update, :destroy]}
  before_action :encure_correct_comedian, {only: [:new, :create]}

  def index
    @search = Comedian.ransack(params[:q])
    @comedians = @search.result.page(params[:page])
  end

  def new
    @comedian = Comedian.new
  end

  def create
    @comedian = Comedian.new(comedian_params)
    @comedian.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @comedian.save
        flash[:success] = '芸人情報を登録しました！'
        redirect_to comedians_path
      else
        render :new
      end
    end
  end

  def show
    if current_user != nil
      @favorite = current_user.favorites.find_by(comedian_id: @comedian.id)
      @schedule = @comedian.performer_management_lives.page(params[:page]).per(3)
    end
  end

  def edit
  end

  def update
    if @comedian.update(comedian_params)
      flash[:success] = '芸人情報を編集しました'
      redirect_to comedians_path
    else
      render :edit
    end
  end

  def destroy
    @comedian.destroy
    flash[:success] = '芸人情報を削除しました！'
    redirect_to comedians_path
  end

  def confirm
    @comedian = Comedian.new(comedian_params)
    @comedian.user_id = current_user.id
    render :new if @comedian.invalid?
  end

  private

  def comedian_params
    params.require(:comedian).permit(:combination_name, :email, :genre, :twitter_url,
                                     :youtube_url, :combination_icon, :combination_icon_cache, :comment, :user_id)
  end

  def set_comedian
    @comedian = Comedian.find(params[:id])
  end

  def encure_correct_entertainer
    @comedian = Comedian.find(params[:id])
    if current_user.id != @comedian.user_id
      flash[:danger] = '権限がありません'
      redirect_to comedians_path
    end
  end

  def encure_correct_comedian
    unless current_user.comedian.nil?
      flash[:danger] = 'すでに芸人として登録されているので新規登録はできません'
      redirect_to comedians_path
    end
  end
end
