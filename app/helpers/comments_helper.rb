module CommentsHelper
  def comments_length(post)
    post.comments.length > 0 ? post.comments.length-1 : 0
  end
end
