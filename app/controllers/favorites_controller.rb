class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorite_comedians.page(params[:page])
  end

  def create
    unless current_user.comedian.id == params[:comedian_id].to_i
      favorite = current_user.favorites.create(comedian_id: params[:comedian_id])
      redirect_to comedians_url, notice: "#{favorite.comedian.combination_name}さんをお気に入り登録しました"
    else
      redirect_to comedians_url, notice: "自分をお気に入り登録できません！"
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to comedians_url, notice: "#{favorite.comedian.combination_name}さんをお気に入り解除しました"
  end
end
