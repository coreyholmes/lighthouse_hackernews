#=================================
# Comments
#=================================

class Comment
  attr_reader :username, :date, :content

  def initialize(username, date, content)
    @username = username
    @date = date
    @content = content
  end
end
