class QuizController < ApplicationController
  before_filter :authenticate
  def fill
    word = Word.find(params[:id])
    assignment_words = current_user.words.where("word_id not in (?)", word).sample(2) << word
    @answers = Word.where("id not in (?)", assignment_words).sample(2).concat(assignment_words).shuffle!
    @sentence = Wordnik.sentence(word.name)
  end
  
  #Determine number of correctly answered questions
  #Update records to reflect the result
  def result
    incorrect = Array.new
    params[:word_id].each_with_index do |word, i|
      if(word != params[:answers][i])
        incorrect << word
      end
    end
    
    attempted_assignment = current_user.assignments.find_all_by_word_id(params[:word_id])
    Assignment.increment_counter(:attempt, attempted_assignment)
    
    incorrect_assignment = current_user.assignments.find_all_by_word_id(incorrect)
    Assignment.increment_counter(:incorrect, incorrect_assignment)
    
    @word_count = params[:word_id].length
    @missed_count = incorrect.length
    @correct_count = @word_count - @missed_count
    @incorrect_words = Word.find(incorrect)
  end
end
