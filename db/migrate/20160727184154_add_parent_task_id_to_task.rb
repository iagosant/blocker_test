class AddParentTaskIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :parent_task_id, :integer
    add_index :tasks, :parent_task_id
  end
end
