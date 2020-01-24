require 'rails_helper'

RSpec.describe 'V1::Projects API', type: :request do
  include Docs::V1::Authentications::Api
  let(:user) { create(:user) }
  let(:invalid_user) { { username: user.username, password: '' } }

  describe 'POST /api/v1/authentication' do
    it 'log in user', :dox do
      post api_v1_authentications_path, params: { username: user.username, password: user.password }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(user.username)
    end

    it 'do not register user' do
      post api_v1_authentications_path, params: invalid_user
      expect(response).to have_http_status(:unauthorized)
      expect(response.body).to include('Invalid password')
    end
  end
end
