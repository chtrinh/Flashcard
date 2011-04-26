class Mnemonic < ActiveRecord::Base
  belongs_to :word
  has_and_belongs_to_many :users
  
  def as_json(options)
    # this example ignores the user's options
    super(:only => [:id, :comment])
  end
end
