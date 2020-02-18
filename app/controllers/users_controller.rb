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
    binding.pry
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:icon,:entertainer,:password,
                                :password_confirmation)
  end
end
