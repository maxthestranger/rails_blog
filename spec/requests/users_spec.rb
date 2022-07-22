require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) {get '/users'}

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'assigns @users' do
      expect(assigns(:users)).to eq(User.all)
    end

    it 'shows corrent content in the page' do
      expect(response.body).to include('List of all Users')
    end
  end

  describe 'GET /show' do
    before(:example) {get '/users/1'}

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'assigns @user' do
      expect(assigns(:user)).to eq(User.find(1))
    end

    it 'shows corrent content in the page' do
      expect(response.body).to include('User Details')
    end
  end
end
