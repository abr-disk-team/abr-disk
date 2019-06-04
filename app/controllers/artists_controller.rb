class ArtistsController < ApplicationController

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(params_artist)
        @artist.save
    end

    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.find(params[:id])
        @artist.update(params_artist)
        redirect_to new_artist_path
    end

    def destroy
        @artist = Artist.find(params[:id])
        @artist.destroy
        redirect_to new_artist_path
    end

    private

    def params_artist
        params.require(:artist).permit(:artist)
    end
end
