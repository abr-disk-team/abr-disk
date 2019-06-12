class CartsController < ApplicationController

    before_action :current_cart
    before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

    def show
        @cart = Cart.find(params[:id])
        @cart_items = CartItem.all

    end

    def add_item 
        if @cart_item.blank?
            @cart_item = @cart.cart_items.build(item_id: params[:id],quantity:1)
        end
        @cart_item.quantity += params[:quantity].to_i
        @cart_item.save
        redirect_to cart_path(@cart)
    end
    
    def update_item
        @cart_item.update(quantity: params[:quantity].to_i)
        redirect_to current_path
    end

    def delete_item
        @cart_item.destroy
        redirect_to current_cart
    end

    private
    def setup_cart_item!
        @cart_item = @cart.cart_items.find_by(item_id: params[:item_id])
    end
end
