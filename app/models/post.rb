class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
end

def update_posts_counter
  self.user.update(posts_counter: self.user.posts.count)
end

def recent_5_comments
  self.comments.order(created_at: :desc).limit(5)
end