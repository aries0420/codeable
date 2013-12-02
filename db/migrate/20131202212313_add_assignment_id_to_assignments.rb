class AddAssignmentIdToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :assignment_id, :integer
  end
end
