class OrdersController < ApplicationController

    def show
        @order = Order.find(params[:id])
    end

    def create
        order = Order.new(order_params)
        order.user_id = current_user.id
        order.save
        buy(order, current_user.cart_items)
        flash[:notice] = "お買い上げありがとうございました。"
        redirect_to items_path
    end

    def index
    end
    private
    def order_params
        params.require(:order).permit(:another_address_id, :payment)
    end
    def buy(order, cart_items)
        cart_items.each do |item|
            OrderItem.create(order_id: order.id, item_id: item.id, order_quantity: item.quantity)
            cart_item = CartItem.find(item.id)
            cart_item.destroy
        end
    end
end
