class CartItemsController < ApplicationController


  # カート内確認
  def index
  end

  # 注文編集
  def form
    @order = Order.new
  end
  # 注文確認画面
  def confirm
    @order = Order.new
  end

  def edit

  end
  # カートアイテム新規作成
  def create
  	    cart_item = CartItem.new(cart_item_params)
        cart_item.item_id  = params[:item_id]
  	    cart_item.user_id = current_user.id
        cart_item.save
        redirect_to user_cart_items_path(current_user.id)
  end
  # カートアイテム編集
  def update
  	  	cart_item = CartItem.find(:id)
        cart_item.update
        redirect_to items_path
  end
  # カートアイテム削除
  def destroy
  	  	cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to user_cart_items_path(current_user.id)
  end

  private
  def cart_item_params
        params.require(:cart_item).permit(:quantity)
  end
end
