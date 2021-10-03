class Review < ApplicationRecord
  #------------------------------ Associations --------------------------------
  belongs_to :user
  belongs_to :movie

  #------------------------------- Validations --------------------------------
  validates :user_id, uniqueness: { scope: :movie_id }
  validates :stars, :inclusion => 0..5
  validates :stars, :review, presence: true

  #---------------------------------- Enums -----------------------------------
  enum reviews: {empty: 0, worst_ever: 1, ok_movie: 2, really_good!: 3, really_really_good: 4, the_best_ever!: 5}

end
