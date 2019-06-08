class OrdersController < ApplicationController

    def show
        @order = Order.find(params[:id])
    end

    def create
        order = Order.find(params[:id])
        order.save
        redirect_to orders_path
    end

    def index
        @orders = Order.all
    end
end
