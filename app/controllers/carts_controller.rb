class CartsController < ApplicationController

    def new
        @cart = Cart.new
    end

    def create
        cart = Cart.new
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def cart_params
        params.require(:cart).permit(:quantity)
end
