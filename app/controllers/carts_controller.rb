class CartsController < ApplicationController
    before_action :authenticate_user!
    before_action :current_cart
    before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

    def show
        @cart = Cart.find(params[:id])
        @cart_items = @cart.cart_items
    end
    def add_item
        if @cart_item.blank?
            @cart_item = @cart.cart_items.build(item_id: params[:id])
        end
        @cart_item.quantity += params[:cart_item][:quantity].to_i
        @cart_item.save
        redirect_to new_cart_path
    end
    def index
        @user = current_user
        @carts = @user.carts
    end

    def update_item
        @cart_item.update(quantity: params[:quantity].to_i)
        redirect_to current_path
        redirect_to cart_path(@cart)
    end

    def form
        @cart = Cart.find(params[:id])
    end

    def check
        @cart = Cart.find(params[:id])
        @cart.update(cart_params)
        redirect_to :action => "confirm"
    end

    def confirm
        @cart = Cart.find(params[:id])
        @cart_items = @cart.cart_items
    end

    private
    def setup_cart_item!
        @cart_item = @cart.cart_items.find_by(item_id: params[:item_id])
    end

    def cart_params
        params.require(:cart).permit(:payment,:shopping_address)
    end
end
