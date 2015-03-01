module API
  class MoviesController < ApplicationController

    def index
      movies = Movie.all
      
      respond_to do |format|
        format.html { render html: movies, status: 200 }
        format.json { render json: movies, status: 200 }
        format.xml { render xml: movies, status: 200 }
      end
    end

    def show
      movie = Movie.find(params[:id])
      render json: movie, status: 200
    end

    def create
      movie = Movie.new(movie_params)
      if movie.save
        render json: movie, status:201, location: movie
      end
    end

    private
      def movie_params
        params.require(:movie).permit(:title, :director, :year)
      end
  end
end