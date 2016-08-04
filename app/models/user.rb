class User < ActiveRecord::Base
  has_many :lists
  has_many :collaborations
  has_many :collaboration_lists, through: :collaborations, :source => :list
end
