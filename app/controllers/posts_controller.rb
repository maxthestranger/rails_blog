class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).where(user: params[:user_id])
  end

  def create
    @post = Post.new(params[:post].permit(:title, :text))
    @post.user = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      flash[:notice] = "Post created successfully!"
      redirect_to user_post_path(current_user, @post)
    else
      flash[:error] = "Post creation failed!"
      render :new
    end
  end

  def new
    @post = Post.new
    render :new
  end

  def show
    @post = Post.includes(:user).find(params[:id])
  end
end
