class Post < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy
  has_many :like, dependent: :destroy

  def update_post_counter
    post_count = Post.includes(:user).count()
    User.update(posts_counter: post_count)
  end

  def five_recent_comments
    Comment.includes(:post).limit(5).order(created_at: :desc)
  end
end
