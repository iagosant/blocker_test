class RemoveCollaborationIdToTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :collaboration_id

  end
end
