class Review < ApplicationRecord
  belongs_to :movie
  def stars_as_percent
    (stars / 5.0) * 100.0
  end
end
