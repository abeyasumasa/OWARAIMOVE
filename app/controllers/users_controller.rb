class UsersController < ApplicationController
  before_action :set_user, only: [:show, :eidt, :update, :ensure_correct_user]
  before_action :encure_correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      # パスワード変更でログアウトするのを防ぐ
      bypass_sign_in(@user, bypass: true) 
      redirect_to user_path(@user), notice: '更新しました'
    else
      render action: :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:icon,:entertainer,:password,
                                :password_confirmation,:icon, :icon_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def encure_correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      flash[:notice] ="権限がありません"
      redirect_to users_path
    end
  end
end
