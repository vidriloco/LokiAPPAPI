class Position < ApplicationRecord
  belongs_to :vehicle
  belongs_to :route
  belongs_to :user
end
