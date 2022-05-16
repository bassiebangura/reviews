class FavoritesController < ApplicationController
    before_action :require_signin, except: [:index, :show]
    
    def create
        @movie = Movie.find(params[:movie_id])
        # @movie.favorites.create!(user: current_user)
        @movie.fans << current_user
        redirect_to @movie
    end
 
end
