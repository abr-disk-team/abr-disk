class ItemsController < ApplicationController

    def new
        @item = Item.new
        @disc = @item.discs.build
        @song = @disc.songs.build
    end

    def create
        item = Item.new(item_params)
        item.save
        redirect_to items_path
    end

    def index
        @items = Item.paginate(page: params[:page], per_page: 20)
        @genres = Genre.all
        @discs = Disc.all
        @songs = Song.all
        @all_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(5).pluck(:item_id))
    end

    def show
        @item = Item.find(params[:id])
        # @cart_item = @item.cart_items.new
        @discs = @item.discs.all
        @songs = Song.all
    end

    def edit
        @item = Item.find(params[:id])
        @genres = Genre.all
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

    def item_params
        params.require(:item).permit(:cd_name, :price, :stock, :genre_id, :label_id, :artist_id, :jacket_image, discs_attributes: [:id, :number, :_destroy, songs_attributes: [:id, :song, :_destroy]])
    end
end
