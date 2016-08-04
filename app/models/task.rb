class Task < ActiveRecord::Base
  belongs_to :list
  has_many :blockers, class_name: "Task", foreign_key: "parent_task_id"
  belongs_to :collaboration
end
