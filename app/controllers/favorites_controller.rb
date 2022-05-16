class FavoritesController < ApplicationController
    before_action :require_signin, except: [:index, :show]
    
    def create
        movie = Movie.find(params[:movie_id])
        movie.fans << current_user
        redirect_to movie
    end
    def destroy
        favorite = current_user.favorites.find(params[:id])
        favorite.destroy

        movie = Movie.find(params[:movie_id])
        redirect_to movie
    end
 
end
