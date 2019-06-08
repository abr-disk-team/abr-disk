class CartsController < ApplicationController

    def new
        @cart = Cart.new
    end

    def create
        cart = Carts.new(cart_params)
        cart.save
        redirect_to root_path
    end

    def show
    end

    def update
    end

    def destroy
    end

    private

    def cart_params
        params.require(:cart).permit(:quantity)
    end
end
