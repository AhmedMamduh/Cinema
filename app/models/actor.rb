class Actor < ApplicationRecord
  #------------------------------ Associations --------------------------------
  has_many :movies_actors
end
