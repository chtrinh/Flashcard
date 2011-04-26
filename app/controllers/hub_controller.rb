class HubController < ApplicationController
  before_filter :authenticate, :except => [:index]
  def index
    if signed_in?
      redirect_to learn_url
    else
      render :layout => false
    end
  end
  
  def learn
    @title = "TeachSavy.com - Flashcard"
    data = []
    
    current_user.lists.find_by_progress("incomplete").words.each do |word|
      data << word
    end
    
    @words = data.shuffle
    @user = current_user
  end
  
  def memorize
    @title = "TeachSavy.com - Flashcard"
    data = []
    
    current_user.lists.find_by_progress("incomplete").words.each do |word|
      data << word
    end
    
    @words = data.shuffle
    @user = current_user
  end
  
  def quiz
    @words = current_user.quizWordList
    word = @words.first
    assignment_words = current_user.words.where("word_id not in (?)", word).sample(2) << word
    @answers = Word.where("id not in (?)", assignment_words).sample(2).concat(assignment_words).shuffle!
    @sentence = Wordnik.sentence(word.name)
  end
end
