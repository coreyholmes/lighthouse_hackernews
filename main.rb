require 'nokogiri'
require 'open-uri'
require 'colorize'

require_relative 'comment'
require_relative 'post'
require_relative 'options'

# Page to scrap
# ------------------------------------------------------
# page = "https://news.ycombinator.com/item?id=7663775"
# scrap = Nokogiri::HTML(open(page))   

# Doc to scrap
# ------------------------------------------------------
url = ARGV[0]
DOC = Nokogiri::HTML(open("#{url}"))

LINE = "-" * 55

# ======================================================
# Program
# ======================================================

system "clear"
post = Post.scrap
puts LINE
puts "#{post.title.white.on_red.bold}"
puts LINE
puts "Written By: #{post.username}"
puts "Article ID: #{post.item_id}"
puts "Rank: #{post.points}"

puts LINE
puts "Comments: #{post.number_of_comments} count"
puts LINE

puts "[1] View Post [2] View Comments"
selected = STDIN.gets.chomp
READ = Nokogiri::HTML(open("#{post.url}"))

if selected == '1'
  puts READ.inner_html.ljust(100)
elsif selected == '2'
  puts post.comments
else

end

