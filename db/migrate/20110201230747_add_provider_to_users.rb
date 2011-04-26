class AddProviderToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :provider, :string
  end

  def self.down
    remove_column :users, :provider
  end
end
