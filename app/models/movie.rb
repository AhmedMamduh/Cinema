class Movie < ApplicationRecord
  #------------------------------ Associations --------------------------------
  has_many :reviews

  #------------------------------ Scopes --------------------------------------
  scope :search_actor, -> (search_key) { where("lower(actor) like ?", "%#{search_key}%")}

end
