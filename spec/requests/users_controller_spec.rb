# spec/requests/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('users Section')
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(name: 'Example User', photo: 'example.jpg', bio: 'Example Bio', posts_counter: 0) }

    it 'returns a successful response' do
      get user_path(user)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('Selected user from the list.')
    end
  end
end
