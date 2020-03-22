class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :eidt, :update, :ensure_correct_user]
  before_action :encure_correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.page(params[:page])
  end

  def show
    @schedule = @user.participant_management_lives.page(params[:page]).per(3)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      if @user.entertainer == true
        redirect_to new_comedian_path, notice: '芸人を作成してください！'
      elsif @user.entertainer == false
        redirect_to user_path(@user), notice: '更新しました'
      end
    else
      render action: :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :icon, :entertainer, :password,
                                 :password_confirmation, :icon, :icon_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def encure_correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      flash[:notice] = "権限がありません"
      redirect_to user_path(current_user.id)
    end
  end
end
