class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :list, index: true
      t.datetime :collaboration_date
      t.timestamps
    end
  end
end
