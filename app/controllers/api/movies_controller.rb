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
  end
end