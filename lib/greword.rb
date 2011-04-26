require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://www.graduateshotline.com/list.html"))

result = doc.css('tbody .content').first.css('tr').css('td:nth-child(odd)')

File.open('words.txt', 'w') do |f|
  result.each do |r|
    f.puts r.text.strip + "\n"
  end
end