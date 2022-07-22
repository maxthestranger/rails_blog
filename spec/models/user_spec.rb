require 'rails_helper'

RSpec.describe User, type: :model do
  new_user = User.new(
    name: 'Max',
    photo: 'https://avatars3.githubusercontent.com/u/1234?s=460&v=4',
    bio: 'This is just a test bio',
    posts_counter: 0
  )

  it 'is valid with valid attributes' do
    expect(new_user).to be_valid
  end

  it 'is not valid without a name' do
    new_user.name = nil
    expect(new_user).to_not be_valid
  end

  it 'is not valid without a photo' do
    new_user.photo = nil
    expect(new_user).to_not be_valid
  end

  it 'is not valid without a bio' do
    new_user.bio = nil
    expect(new_user).to_not be_valid
  end

  it 'is not valid without a posts_counter' do
    new_user.posts_counter = nil
    expect(new_user).to_not be_valid
  end

  it 'is not valid with a posts_counter less than 0' do
    new_user.posts_counter = -1
    expect(new_user).to_not be_valid
  end

  it 'is not valid with a posts_counter greater than 0' do
    new_user.name = 'Max'
    new_user.posts_counter = 1
    expect(new_user).to be_valid
  end

  it 'is not valid with a posts_counter not an integer' do
    new_user.posts_counter = 1.5
    expect(new_user).to_not be_valid
  end

  it 'is not valid with a name longer than 30 characters' do
    new_user.name = 'a' * 31
    expect(new_user).to_not be_valid
  end

  describe '#three_recent_posts' do
    let(:user) { User.create!(
      name: 'Max',
      photo: 'https://avatars3.githubusercontent.com/u/1234?s=460&v=4',
      bio: 'This is just a test bio',
      posts_counter: 0
    ) }
    let(:post1) { Post.new(title: 'Test Post 1', user: user, text: 'This is just a test post 1', comments_counter: 0, likes_counter: 0) }
    let(:post2) { Post.new(title: 'Test Post 2', user: user, text: 'This is just a test post 2', comments_counter: 0, likes_counter: 0) }
    let(:post3) { Post.new(title: 'Test Post 3', user: user, text: 'This is just a test post 3', comments_counter: 0, likes_counter: 0) }
    let(:post4) { Post.new(title: 'Test Post 4', user: user, text: 'This is just a test post 4', comments_counter: 0, likes_counter: 0) }

    it 'return nothing if there are no posts' do
      expect(user.three_recent_posts).to be_empty
    end

    it 'returns the three most recent posts' do
      post1.save!
      post2.save!
      post3.save!
      post4.save!
      expect(user.three_recent_posts).to eq([post4, post3, post2])

      post4.destroy
      expect(user.three_recent_posts).to eq([post3, post2, post1])

      post3.destroy
      expect(user.three_recent_posts).to eq([post2, post1])

      post2.destroy
      expect(user.three_recent_posts).to eq([post1])

      post1.destroy
      expect(user.three_recent_posts).to eq([])
    end
  end
end
