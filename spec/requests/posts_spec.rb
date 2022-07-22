require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) {get '/users/1/posts'}

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'assigns @posts' do
      expect(assigns(:posts)).to eq(Post.all)
    end

    it 'shows corrent content in the page' do
      expect(response.body).to include('List of all posts')
    end
  end

  describe 'GET /show' do
    before(:example) {get '/users/1/posts/1'}

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'assigns @post' do
      expect(assigns(:post)).to eq(Post.find(1))
    end

    it 'shows corrent content in the page' do
      expect(response.body).to include('Post Details')
    end
  end
end
