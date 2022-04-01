class MoviesController < ApplicationController
    def index
        @movies = ["Rambo I", "Rambo II", "Rambo III", "Rambo IV", "Rambo V"]
    end
end
