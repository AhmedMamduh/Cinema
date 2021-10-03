class Movie < ApplicationRecord
  #------------------------------ Associations --------------------------------
  has_many :reviews
  has_many :movies_actors
  has_many :actors, through: :movies_actors

  #---------------------------------- Enums -----------------------------------
  enum countries: {us: 0, uk: 1}

  #------------------------------ Scopes --------------------------------------
  scope :search_actor, -> (search_key) { joins(:actors).where("lower(actors.name) like ?", "%#{search_key}%")}

end
