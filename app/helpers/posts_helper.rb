module PostsHelper

  def find_indetify_post(post, previous=false)
    posts = Post.all
    flag=false

    index=posts.find_index(post)
    if previous == true 
      if index>0
        index=index-1        
      else
        return nil
      end
    else
      if index==posts.length
        return nil
      else
        index=index+1
      end
    end

    return posts[index] 
  end

  def find_previous_post(post)
    find_indetify_post(post, true)
  end

  def find_next_post(post)
    find_indetify_post(post)
  end

end
