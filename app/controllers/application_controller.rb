class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
  # before_action :authenticate_user!

  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # このアクションを追加
  def after_sign_in_path_for(resource)
    "/users/#{current_user.id}"
  end

  protected

  def configure_permitted_parameters
    # 入力フォームからアカウント名情報をDBに保存するために追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :entertainer])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
  end

  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end
end
