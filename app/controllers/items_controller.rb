class ItemsController < ApplicationController

    def new
        @item = Item.new
    end

    def create
        item = Item.new(params_item)
        redirect_to items_path
    end
        
    def index
        items = Item.all
    end

    def show
        item = Item.find(params[:id])

    end

    def edit
        item = Item.find(params[:id])
    end

    def update
        item.udate
    end

    def destroy
        item = Item.find(params[:id])
        Item.destroy
        redirect_to items_path
    end

    private

    def params_item
        params.require(:item).permit(:cd_name, :price, :stock)
    end
end
