class LivesController < ApplicationController
  def index
  end

  def new
    @live = Live.new
  end

  def create
    @live = Live.create(live_params)
    binding.pry
    redirect_to lives_path
  end

  def show
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
