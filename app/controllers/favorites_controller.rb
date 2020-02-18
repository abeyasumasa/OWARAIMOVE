class FavoritesController < ApplicationController
    def create
        favorite = current_user.favorites.create(blog_id: params[:blog_id])
        redirect_to blogs_url, notice: "#{favorite.comedian.combination_name}さんをお気に入り登録しました"
      end
      def destroy
        favorite = current_user.favorites.find_by(id: params[:id]).destroy
        redirect_to blogs_url, notice: "#{favorite.comedian.combination_name}さんをお気に入り解除しました"
      end
end
