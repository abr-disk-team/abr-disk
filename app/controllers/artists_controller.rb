class ArtistsController < ApplicationController
    before_action :authenticate_user!
    def new
        @artist = Artist.new
        unless user_signed_in? && current_user.admin
            redirect_to items_path
        end
    end

    def create
        @artist = Artist.new(artist_params)
        @artist.save
        redirect_to new_artist_path
    end

    def edit
        @artist = Artist.find(params[:id])
        unless user_signed_in? && current_user.admin
            redirect_to items_path
        end
    end

    def update
        @artist = Artist.find(params[:id])
        @artist.update(artist_params)
        redirect_to new_artist_path
    end

    def destroy
        @artist = Artist.find(params[:id])
        @artist.destroy
        redirect_to new_artist_path
    end

    private

    def artist_params
        params.require(:artist).permit(:artist)
    end
end
