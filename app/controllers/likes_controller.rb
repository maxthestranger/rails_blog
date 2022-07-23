class LikesController < ApplicationController
  def create
    @post = Post.includes(:user).find(params[:post_id])
    @post_author = @post.user
    @user = current_user

    @liked_posts = Like.where(user: @user, post: @post)

    destroy && return if @liked_posts.present?

    like = Like.create(user: @user, post: @post)

    return unless like.save

    flash[:notice] = 'You liked this post.'
    redirect_back_or_to user_post_path(@post_author, @post)
  end

  def destroy
    @liked_posts.destroy_all
    flash[:notice] = 'Likes deleted successfully!'
    redirect_back_or_to user_post_path(@post_author, @post)
  end
end
