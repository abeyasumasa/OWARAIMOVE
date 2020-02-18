class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user.id == @user.id
      # パスワード変更でログアウトするのを防ぐ
      sign_in(@user, bypass: true) 
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
end
