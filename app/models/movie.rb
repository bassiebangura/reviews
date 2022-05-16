class Movie < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :fans, through: :favorites, source: :user
    has_many :critics, through: :reviews, source: :user
    
    def flopper?
        total_gross.blank? || total_gross < 500000000
    end
end