class AddProgressToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :progress, :string, :default => "incomplete"
  end

  def self.down
    remove_column :lists, :progress
  end
end
