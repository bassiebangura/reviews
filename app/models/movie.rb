class Movie < ApplicationRecord
    def flopper?
        total_gross.blank? || total_gross < 50000000
    end
end
