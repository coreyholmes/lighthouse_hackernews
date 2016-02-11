#=================================
# Posts
#=================================
class Post
  attr_reader :title, :username, :url, :points, :item_id

  def initialize(title, username, url, points, item_id)
    @title = title
    @username = username
    @url = url
    @points = points
    @item_id = item_id
  end

#=================================
# Comments
#=================================
  def comments
    #Get Comments
    comment = DOC.search('.default').map { |comment| comment.inner_text }
  end

  def number_of_comments
    comments.length
  end

#=================================
# Scrap
#=================================
  def self.scrap
    #Get Title
    title = DOC.search('.title > a').inner_text
    #Get Username
    username = DOC.search('.subtext > a').map { |a| a.inner_text}
    username = username[0]

    #Get URL
    url = DOC.search('.title > a').map { |link| link['href']}
    url = url[0]

    #Get Points
    points = DOC.search('.subtext > span:first-child').map { |span| span.inner_text}
    points = points[0]

    #Get Item ID
    id =  DOC.search('.age > a').map { |id| id['href'][(/\d{7}/)] }
    item_id = id[0]

    #Return Post.new(title, url, points, item_id)
    Post.new(title, username, url, points, item_id)
  end
end




# # #Get Username
#     # username = DOC.search('.comhead > a:first-child').map { |element| element.inner_text }
#     # puts "Number of Users: #{username.length}"
#     # #Get Date
#     # date = DOC.search('.age > a').map { |a| a.inner_text }

#     #Get Comments
#     content = DOC.search('.comment > .c00').map { |comment| comment.inner_text }
#     puts "Number of Comments: #{content.length}"