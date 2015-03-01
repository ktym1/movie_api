module API
  class MoviesController < ApplicationController

    def index
      movies = Movie.all
      render json: movies, status: 200
    end

    def show
      movie = Movie.find(params[:id])
      render json: movie, status: 200
    end
  end
end