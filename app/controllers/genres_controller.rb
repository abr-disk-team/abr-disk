class GenresController < ApplicationController


    def new
        @genre = Genre.new
    end

    def create
        genre = Genre.new(genre_params)
        genre.save
        redirect_to new_genre_path
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        genre = Genre.find(params[:id])
        genre.update(genre_params)
        redirect_to new_genre_path
    end

    def destroy
        @genre = Genre.find(params[:id])
        @genre.destroy
        redirect_to new_genre_path
    end

    private

    def genre_params
        params.require(:genre).permit(:genre)
    end
end

