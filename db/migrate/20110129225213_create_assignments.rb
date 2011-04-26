class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.integer :user_id
      t.integer :list_id
      t.integer :incorrect
      t.boolean :completed
      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end
