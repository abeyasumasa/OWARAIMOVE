class LivesController < ApplicationController
  def index
    @lives = Live.all
  end

  def new
    @live = Live.new
  end

  def create
    @live = Live.create(live_params)
    redirect_to lives_path
  end

  def show
    @live = Live.find(params[:id])
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def live_params
    params.require(:live).permit(:title, :content, :place, :date, :start_time, :ending_time, :price, :viewer)
  end

end
