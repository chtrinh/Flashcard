class User < ActiveRecord::Base
  has_many :assignments
  has_many :words, :through => :assignments
  has_many :lists
  has_and_belongs_to_many :mnemonics
  
  after_create :generateWordList
  
  def generateWordList
    ids = self.words
    # self.lists.each do |list|
    #   ids << list.word_ids
    # end
    # ids = ids.flatten
    
    wordResult = (ids.empty?) ? Word.all : Word.where("id not in (?)", ids)
    wordResult.shuffle!
    
    list = self.lists.create(:name => "GRE-#{self.lists.count}")
    list.words << wordResult[1..10]
    
    wordResult[1..10].each do |word|
      self.assignments.create(:word_id => word.id)
    end
  end
  
  def quizWordList
    limit = 5
    max = self.assignments.count - limit
    new_words = self.words.find(:all, :limit => limit, :offset => rand(max), :order => "attempt ASC")
    incorrect_words = self.words.find(:all, :limit => limit, :offset => rand(max), :order => "incorrect DESC")
    result = new_words.concat(incorrect_words)
    result.shuffle!
  end
  
  def getMnemonic(word)
    self.mnemonics.each do |m|
      return m if m.word_id == word.id
    end
    return nil
  end
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
    end
  end
end
