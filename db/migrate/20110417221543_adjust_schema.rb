class AdjustSchema < ActiveRecord::Migration
  def self.up
    remove_column :assignments, :completed
    remove_column :assignments, :list_id
    remove_column :assignments, :incorrect
    
    add_column :assignments, :word_id, :integer
    add_column :assignments, :score, :integer, :default => 0
    add_column :assignments, :attempt, :integer, :default => 0
  end

  def self.down
    remove_column :assignments, :word_id
    remove_column :assignments, :score
    remove_column :assignments, :attempt
    
    add_column :assignments, :completed, :boolean
    add_column :assignments, :list_id, :integer
    add_column :assignments, :incorrect, :integer
  end
end
