class Wordnik
  include HTTParty
  base_uri 'api.wordnik.com/v4'
  default_params :api_key => Flashcard::Application.config.wordnik_api_key
  format :json
  
  def self.definitions(word, query={})
    query.merge!({:sourceDictionary => 'ahd', :useCanonical => true,
           :limit => 4})
    result = get("/word.json/#{word}/definitions", :query => query).parsed_response
  end
  
  def self.flashcard(word, query={})
    result = Array.new()
    result.push(definitions(word))
    result.push(examples(word))
    result.push(synonym(word))
  end
  
  def self.examples(word, query={})
    result = get("/word.json/#{word}/topExample", :query => query).parsed_response
  end
  
  def self.sentence(word, query={})
    query.merge!({:includeDuplicates => false, :limit => 1, :skip => rand(15)})
    result = get("/word.json/#{word}/examples", :query => query).parsed_response["examples"][0]["text"]
    result.sub(/#{word}/, "______")
  end

  def self.audio(word, query={})
    query.merge!({:limit => 1})
    result = get("/word.json/#{word}/audio", :query => query).parsed_response[0]
    
    if(!result.nil?)
      result = result["fileUrl"]
    end 
    result
  end
  
  def self.synonym(word, query={})
    query.merge!({:type => "synonym"})
    temp = get("/word.json/#{word}/related", :query => query).parsed_response[0]
    
    result = temp.nil? ? nil : temp["words"]
    
  end
end
