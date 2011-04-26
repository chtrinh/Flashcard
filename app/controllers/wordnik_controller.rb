class WordnikController < ApplicationController  
  def definitions
    respond_to do |f|
      result = Wordnik.definitions(params[:id].downcase)
      f.html { render :json => result}
      f.json { render :json => result}
    end
  end
  
  def flashcard
    respond_to do |f|
      result = Wordnik.flashcard(params[:id].downcase)
      f.html { render :json => result}
      f.json { render :json => result}
    end
  end
  
  def example
    respond_to do |f|
      result = Wordnik.example(params[:id].downcase)
      result = result[rand(result.size)]
      f.html { render :json => result}
      f.json { render :json => result}
    end
  end
  
  def audio
    respond_to do |f|
      result = Wordnik.audio(params[:id].downcase)  
      f.html { 
        if(result.nil?)
          render :text => "Not found", :status => :not_found
        else
          render :text => result
        end
      }
    end
  end
end
