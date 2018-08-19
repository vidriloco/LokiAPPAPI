class Role < ApplicationRecord
  PASSENGER="passenger"
  DRIVER="driver"
  
  has_many :users
  
  def self.types
    [DRIVER, PASSENGER]
  end
end
