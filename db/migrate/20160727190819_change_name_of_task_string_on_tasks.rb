class ChangeNameOfTaskStringOnTasks < ActiveRecord::Migration
  def change
    rename_column :tasks, :task, :detail
  end
end
