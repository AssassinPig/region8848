class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if !@comment.save
      flash.now[:error] = "save failed" 
      redirect_to @post
    else  
      redirect_to @post
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :email, :content, :website, :post_id)
  end
end
