class User < ActiveRecord::Base
  has_many :collaborations
  has_many :lists, through: :collaborations
end
