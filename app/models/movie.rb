class Movie < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :favorites, dependent: :destroy
    def flopper?
        total_gross.blank? || total_gross < 500000000
    end
end
