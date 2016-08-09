class List < ActiveRecord::Base
  belongs_to :owner, class_name:"User", foreign_key:"user_id"
  belongs_to :user
  # has_many :task
  # has_many :users, :through => :tasks
  has_many :tasks

  has_many :collaborations
  has_many :collaboration_users, through: :collaborations, :source => :user
end
