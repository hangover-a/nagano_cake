class Administrator::GenresController < ApplicationController

  def index
    @genre_new = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to administrator_genres_path
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to administrator_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end

end
