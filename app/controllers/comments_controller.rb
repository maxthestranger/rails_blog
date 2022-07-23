class CommentsController < ApplicationController
  def index
    post = Post.includes(:user).find(params[:post_id])
  end

  def create
    comment_author = current_user
    comment_body = params[:comment]
    post = Post.find(params[:post_id])
    post_author = post.user

    comment = Comment.new(text: comment_body.permit(:text), user: comment_author, post: post)
    return unless comment.save

    respond to do |format|
      flash[:notice] = "Comment created successfully!"
      format.html { redirect_to user_post_path(post_author, post) }
    end
  end
end
