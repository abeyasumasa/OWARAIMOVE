class ComediansController < ApplicationController
  def index
    @comedians = Comedian.all
  end

  def new
    @comedian = Comedian.new
  end

  def create
    @comedian = Comedian.create(comedian_params)
    if @comedian.save
      redirect_to comedian_path(params[:id]) , notice:"登録しました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comedian_params
    params.require(:comedian).permit(:combination_name, :email, :genre, :twitter_url,
    :youtube_url, :combination_icon, :comment)
  end
end
