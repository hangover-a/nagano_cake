class Administrator::GenresController < ApplicationController

  def index
    @genre_new = Genre.new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to administrator_genres_path
  end

  def update
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end

end
