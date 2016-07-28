class AddCollaborationIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :collaboration_id, :integer
    add_index :tasks, :collaboration_id
  end
end
