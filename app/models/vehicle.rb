class Vehicle < ApplicationRecord
  has_many :positions
  belongs_to :route
end
