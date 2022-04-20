module MoviesHelper
    def format_total_gross(movie)
        if movie.flopper?
            content_tag(:strong, 'Flop!')
        else
            number_to_currency(movie.total_gross)
        end
    end
    def year_of(movie)
        movie.released_on.year
    end
end
