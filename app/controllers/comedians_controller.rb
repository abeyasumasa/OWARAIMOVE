class ComediansController < ApplicationController
  before_action :set_comedian, only: [:show, :edit, :update, :destroy]

  def index
    @comedians = Comedian.all
  end

  def new
    @comedian = Comedian.new
  end

  def create
    @comedian = Comedian.create(comedian_params)
    if params[:back]
      render :new
    else
      if @comedian.save
        redirect_to comedian_path(params[:id]) , notice:"登録しました！"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @comedian.update(comedian_params)
      rediret_to comedians_path, notice:"芸人情報を編集しました"
    else
      reder :edit
    end
  end

  def destroy
    @comedian.destroy
    redirect_to comedians_path, notice:"芸人情報を削除しました！"
  end

  def confirm
    @comedian = Comedian.new(comedian_params)
    render :new if @comedian.invalid?
  end

  private

  def comedian_params
    params.require(:comedian).permit(:combination_name, :email, :genre, :twitter_url,
    :youtube_url, :combination_icon, :comment)
  end

  def set_comedian
    @comedian = Comedian.find(params[:id])
  end
end
