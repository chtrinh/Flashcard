class CreateListsWords < ActiveRecord::Migration
  def self.up
    create_table :lists_words, :id => false do |t|
      t.integer :list_id
      t.integer :word_id
    end
  end

  def self.down
    drop_table :lists_words
  end
end
