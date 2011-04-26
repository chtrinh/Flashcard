class CreateMnemonicsUsers < ActiveRecord::Migration
  def self.up
    create_table :mnemonics_users, :id => false do |t|
      t.integer :mnemonic_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :mnemonics_users
  end
end
