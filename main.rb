require 'nokogiri'
require 'open-uri'
require 'colorize'

require_relative 'comment'
require_relative 'post'
require_relative 'options'

# Doc to scrap
# ------------------------------------------------------
url = ARGV[0]
DOC = Nokogiri::HTML(open("#{url}"))
LINE = "\n" + "-" * 55 + "\n\n"

# ======================================================
# Commands
# ======================================================                 

# You can run this command in your terminal. 
# ruby main.rb https://news.ycombinator.com/item?id=7663775

# You can replace the URL with any URL from ycombinator 
# Hacker News.

# That's all there is to is.

# ======================================================
# Program
# ======================================================

system "clear"

puts art = '
██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗ 
██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
███████║███████║██║     █████╔╝ █████╗  ██████╔╝
██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
                                                
███╗   ██╗███████╗██╗    ██╗███████╗            
████╗  ██║██╔════╝██║    ██║██╔════╝            
██╔██╗ ██║█████╗  ██║ █╗ ██║███████╗            
██║╚██╗██║██╔══╝  ██║███╗██║╚════██║            
██║ ╚████║███████╗╚███╔███╔╝███████║            
╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝ ╚══════╝                                                        
'
post = Post.scrap
puts LINE
puts "#{post.title.white.on_red.bold}"
puts LINE
puts "Written By: #{post.username}".underline + "Date: #{post.date}".underline.rjust(45)
puts "Article ID: #{post.item_id}"
puts "Rank: #{post.points}"
# puts "Date: #{post.date}"

puts LINE
puts "Comments: #{post.number_of_comments} count"
puts '
███████████████████████████████████████████████████████           
╚═════════════════════════════════════════════════════╝
'
puts "\n\n"
print "[1] View Post [2] View Comments".rjust(41)
selected = STDIN.gets.chomp
READ = Nokogiri::HTML(open("#{post.url}"))

if selected == '1'
  puts READ.inner_html.ljust(100)
elsif selected == '2'
  puts post.comments
else

end



