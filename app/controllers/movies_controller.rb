class MoviesController < ApplicationController
    before_action :require_signin, except: [:index, :show]
    before_action :require_admin, except: [:index, :show]
    def index
        @movies = Movie.all
    end
    def show
        @movie = Movie.find(params[:id])
        @fans = @movie.fans
    end
    def edit
        @movie = Movie.find(params[:id])
    end
    def update
        @movie = Movie.find(params[:id])
        
        @movie.update(movie_params)
        redirect_to @movie
    end
    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to movies_url
    end
    def new
        @movie = Movie.new
    end
    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to @movie
        else
            render :new
        end
    end
    
    private
    def movie_params
        params.require(:movie).permit(:title, :description, :released_on, :total_gross, :rating)
    end
end

