class ItemsController < ApplicationController

    def new
        @item = Item.new
        @item.discs.build
        @disc = Disc.new
    end

    def create
        item = Item.new(params_item)
        item.save
        redirect_to items_path
    end
        
    def index
        @items = Item.all
        
    end

    def show
        @item = Item.find(params[:id])
        @cart_item = @item.cart_items.new
    end
 
    def edit
        @item = Item.find(params[:id])
    end

    def update
        item = Item.find(params[:id])
        item.update(params_item)
        redirect_to items_path
    end

    def destroy
        item = Item.find(params[:id])
        Item.destroy
        redirect_to items_path
    end

    private

    def params_item
        params.require(:item).permit(:cd_name, :price, :stock, :genre_id, :label_id, :artist_id, :jacket_image, discs_attributes: [:id, :number, :_destroy, songs_attributes: [:id, :song, :_destroy]])
    end
end
