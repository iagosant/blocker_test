class User < ActiveRecord::Base
  has_many :created_lists, class_name: "List"
  # # has_many :tasks
  # has_many :lists, :through => :tasks
  has_one :all_tasks, class_name: "List"
  has_many :collaborations
  has_many :collaboration_lists, through: :collaborations, :source => :list

  has_many :tasks
  has_many :collaboration_tasks, through: :collaboration_lists, :source => :tasks
  has_many :my_tasks, through: :created_lists, :source => :tasks
end
