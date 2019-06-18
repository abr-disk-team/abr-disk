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
  # 以下記載をitems/showの該当部分に記載する
  # <% if @item.favorited_by?(current_user) %>
  #       <%= link_to item_favorites_path(@item.id), method: :delete do %>
  #         <span class="glyphicon glyphicon-heart" aria-hidden="true" style="color: red;"></span>
  #       <% end %>
  #       <br>
  #       <%= @item.favorites.count %>
  #       <span style="font-size: 8px;">いいね</span>
  #   <% else %>
  #       <%= link_to item_favorites_path(@item.id), method: :post do %>
  #         <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
  #       <% end %>
  #       <br>
  #        <%= @item.favorites.count %>
  #        <span style="font-size: 8px;">いいね</span>
  #   <% end %>
end
