class ItemsController < ApplicationController

    def new
        @item = Item.new
        @item.discs.build
        unless user_signed_in? && current_user.admin
            redirect_to items_path
        end
    end

    def create
        @item = Item.new(item_params)
        # binding.pry
        if @item.save
            redirect_to item_path(@item.id)
        else
            render :action => "new"
        end
    end

    def index
        @items = Item.paginate(page: params[:page], per_page: 20)
        @genres = Genre.all
        @discs = Disc.all
        @songs = Song.all
        @q = Item.ransack(params[:q])
        @items = @q.result(distinct: true).paginate(page: params[:page], per_page: 20)
        @all_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(5).pluck(:item_id))
    end

    def show
        @item = Item.find(params[:id])
        @cart_item = @item.cart_items.new
        @discs = @item.discs.all
    end

    def edit
        @item = Item.find(params[:id])
        unless user_signed_in? && current_user.admin
            redirect_to item_path(@item.id)
        end
    end

    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            redirect_to items_path
        else
            render :action => "edit"
        end
    end

    def destroy
        item = Item.find(params[:id])
        Item.destroy
        redirect_to items_path
    end

    private
    def item_params
        params.require(:item).permit(:cd_name, :price, :stock, :genre_id, :label_id, :artist_id, :jacket_image, discs_attributes: [:id, :number, :_destroy, songs_attributes: [:id, :song, :_destroy ]])
    end
end
