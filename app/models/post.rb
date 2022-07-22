class Post < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy
  has_many :like, dependent: :destroy

  after_save :update_post_counter

  def update_post_counter
    user.update(posts_counter: user.post.count)
  end

  def five_recent_comments
    comment.includes(:user).order(created_at: :DESC).limit(5)
  end
end
