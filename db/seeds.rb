# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

wordFile = "#{Rails.root}/lib/words.txt"

File.open(wordFile, 'r') do |f|
  while line = f.gets
    Word.find_or_create_by_name(line.strip)
  end
end