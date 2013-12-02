class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :category
      t.string :title
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
