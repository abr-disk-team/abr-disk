class OrdersController < ApplicationController

    def create
        order = Order.new(order_params)
        order.user_id = current_user.id
        order.save
        buy(order, current_user.cart_items)
        flash[:notice] = "お買い上げありがとうございました。"
        redirect_to items_path
    end

    def edit
        @order = Order.find(params[:id])
    end
    def update
        order = Order.find(params[:id])
        order.update(order_params)
        flash[:notice] = "購入履歴が更新されました。"
        redirect_to user_orders_path(current_user.id)
    end

    def show
        @order = Order.find(params[:id])
        total_price(@order.order_items)
    end

    def index
        @orders = Order.all
        @user = User.find(params[:user_id])
    end
    private
    def order_params
        params.require(:order).permit(:address_id, :payment, :status)
    end
    def buy(order, cart_items)
        cart_items.each do |item|
            OrderItem.create(order_id: order.id, item_id: item.id, order_quantity: item.quantity)
            cart_item = CartItem.find(item.id)
            cart_item.destroy
        end
    end
    def total_price(order_items)
        @total_price = 0
        order_items.each do |order_item|
          subtotal = order_item.item.price * order_item.order_quantity
          @total_price += subtotal
        end
    end

end
