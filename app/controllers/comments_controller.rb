class CommentsController < ApplicationController
  def index
    post = Post.includes(:user).find(params[:post_id])
  end

  def create
    comment_author = current_user
    comment_body = params[:comment]
    post = Post.find(params[:post_id])
    post_author = post.user

    comment = Comment.new(comment_body.permit(:text))
    comment.user = comment_author
    comment.post = post
    return unless comment.save

    respond_to do |format|
      format.html do
        flash[:notice] = "Comment created successfully!"
        redirect_to user_post_path(post_author, post)
      end
    end
  end
end
