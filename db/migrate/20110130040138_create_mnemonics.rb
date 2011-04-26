class CreateMnemonics < ActiveRecord::Migration
  def self.up
    create_table :mnemonics do |t|
      t.integer :user_id
      t.integer :word_id
      t.string :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :mnemonics
  end
end
