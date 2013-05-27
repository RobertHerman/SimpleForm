class Member < ActiveRecord::Base
  attr_accessible :accepted_eua, :age, :favorite_food, :name
end
