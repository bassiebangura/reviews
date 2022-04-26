class ReviewsController < ApplicationController
    def index
        @movie = Movie.find(params[:movie_id])   
        arrayOfReviews = @movie.reviews
        @reviews = arrayOfReviews
     end
end
