class Word < ActiveRecord::Base
  has_and_belongs_to_many :lists
  has_many :mnemonics
  has_many :assignments
  has_many :users, :through => :assignments
  
  def self.randomFetch(limit = 4)
    list = []
    max = self.count
    1.upto(limit) do 
      list << rand(max)
    end
    Word.find(list)
  end
end
