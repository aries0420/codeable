class AddWeekAndNoteToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :week, :string
    add_column :assignments, :note, :text
  end
end
