class FixAssignments < ActiveRecord::Migration
  def self.up
    remove_column :assignments, :score
    add_column :assignments, :incorrect, :integer, :default => 0
  end

  def self.down
    remove_column :lists, :incorrect
    add_column :assignments, :score, :integer, :default => 0
  end
end
