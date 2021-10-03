class Movie < ApplicationRecord
  #------------------------------ Associations --------------------------------
  has_many :reviews
end
