class FavoritesController < ApplicationController
	def create
		item = Item.find(params[:item_id])
		favorite = current_user.favorites.new(item_id: item.id)
		favorite.save
		redirect_to item_path(item.id)
	end
	def destroy
		item = Item.find(params[:item_id])
		favorite = current_user.favorites.find_by(item_id: item.id)
		favorite.destroy
		redirect_to item_path(item.id)
	end
	# 商品一覧ページからいいねされた時のアクション
	def create_index
		item = Item.find(params[:item_id])
		favorite = current_user.favorites.new(item_id: item.id)
		favorite.save
		redirect_to items_path
	end
	# 商品一覧ページからアクションが消された時のアクション
	def destroy_index
		item = Item.find(params[:item_id])
		favorite = current_user.favorites.find_by(item_id: item.id)
		favorite.destroy
		redirect_to items_path
	end
	def show
		@favorites = current_user.favorites
		# @favorites = Favorite.where(user_id: params[:id])
	end
end
