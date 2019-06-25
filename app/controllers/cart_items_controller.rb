class CartItemsController < ApplicationController

    before_action :check_address, only: [:form]
    before_action :check_login, only: [:create, :index]

  # カート内確認
  def index
    @user = User.find(params[:user_id])
    total_price(@user.cart_items)
  end

  # 注文編集
  def form
    @user = User.find(params[:user_id])
    @order = Order.new
    total_price(@user.cart_items)
  end
  def form_confirm
    @order = Order.new(order_params)
    @user = User.find(params[:user_id])
    total_price(@user.cart_items)
    render :confirm
  end
  # 注文確認画面
  def confirm
    @user = User.find(params[:user_id])
    @order = Order.new(order_params)
    total_price(@user.cart_items)
  end

  def edit

  end
  # カートアイテム新規作成
  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.item_id  = params[:item_id]
    cart_item.user_id = current_user.id
    cart_item.save
    flash[:notice] = "一件の商品がカートに追加されました。"
    redirect_to items_path
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
  def order_params
    params.require(:order).permit(:address_id, :payment)
  end
  def total_price(cart_items)
    @total_price = 0
    cart_items.each do |cart_item|
      subtotal = cart_item.item.price * cart_item.quantity
      @total_price += subtotal
    end
  end
  def check_address
      user = User.find(params[:user_id])
      unless user.addresses.any?
        flash[:notice] = "住所を入力してください。"
        redirect_to new_user_address_path(user.id)
      end
  end
  def check_login
    unless user_signed_in?
      flash[:check] = "カート機能を利用するにはユーザー登録が必要です。"
      redirect_to items_path
    end
  end
end
