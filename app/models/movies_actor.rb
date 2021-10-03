class MoviesActor < ApplicationRecord
  belongs_to :actor
  belongs_to :movie

  #------------------------------- Validations --------------------------------
  validates :actor_id, uniqueness: { scope: :movie_id }
  validates :actor_id, :movie_id, presence: true
end
