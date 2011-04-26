class RemoveUserIdFromMnemonic < ActiveRecord::Migration
  def self.up
    remove_column :mnemonics, :user_id
    add_column :mnemonics, :owner_id, :integer
  end

  def self.down
    add_column :mnemoincs, :user_id, :integer
    remove_column :mnemonics, :owner_id
  end
end
