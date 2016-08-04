class List < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :collaboration_users, through: :collaborations, :source => :user
end
