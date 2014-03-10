class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    Rails.logger.debug(comment_params)
    if !@comment.save
      flash[:error] = "save failed" 
    end
    redirect_to @post
  end

  def comment_params
    params.require(:comment).permit(:name, :email, :content, :website, :post_id)
  end
end
