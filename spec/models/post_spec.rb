require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create!(name: 'Max', photo: 'https://avatars3.githubusercontent.com/u/1234?s=460&v=4', bio: 'This is just a test bio', posts_counter: 0) }
  let(:post) { user.post.create!(title: 'Test Post', text: 'This is just a test post', comments_counter: 0, likes_counter: 0) }
  let(:comment1) { post.comment.create!(text: 'This is just a test comment 1', user: user) }
  let(:comment2) { post.comment.create!(text: 'This is just a test comment 2', user: user) }
  let(:comment3) { post.comment.create!(text: 'This is just a test comment 3', user: user) }
  let(:comment4) { post.comment.create!(text: 'This is just a test comment 4', user: user) }
  let(:comment5) { post.comment.create!(text: 'This is just a test comment 5', user: user) }

  it 'is valid with valid attributes' do
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'is not valid without a text' do
    post.text = nil
    expect(post).to_not be_valid
  end

  it 'is not valid without a comments_counter' do
    post.comments_counter = nil
    expect(post).to_not be_valid
  end

  it 'is not valid with a comments_counter less than 0' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'is not valid with a comments_counter greater than 0' do
    post.comments_counter = 1
    expect(post).to be_valid
  end

  it 'is not valid with a comments_counter not an integer' do
    post.comments_counter = 1.5
    expect(post).to_not be_valid
  end

  it 'is not valid without a likes_counter' do
    post.likes_counter = nil
    expect(post).to_not be_valid
  end

  it 'is not valid with a likes_counter less than 0' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end

  it 'is not valid with a likes_counter greater than 0' do
    post.likes_counter = 1
    expect(post).to be_valid
  end

  it 'is not valid with a likes_counter not an integer' do
    post.likes_counter = 1.5
    expect(post).to_not be_valid
  end

  it 'is not valid with a title longer than 250 characters' do
    post.title = 'a' * 251
    expect(post).to_not be_valid
  end

  it 'post#five_recent_comments' do
    expect(post.five_recent_comments).to eq([comment5, comment4, comment3, comment2, comment1])
  end
end
