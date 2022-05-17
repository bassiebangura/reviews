class FavoritesController < ApplicationController
    before_action :require_signin, except: [:index, :show]
    before_action :set_movie, only: [:create, :destroy]
    def create
        set_movie.fans << current_user
        redirect_to set_movie
    end
    def destroy
        
        favorite = current_user.favorites.find(params[:id])
        favorite.destroy
        redirect_to set_movie
    end
 
    private
    def set_movie
        @movie = Movie.find(params[:movie_id])
    end
end
