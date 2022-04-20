class Movie < ApplicationRecord
    def flopper?
        total_gross.blank? || total_gross < 500000000
    end
end
