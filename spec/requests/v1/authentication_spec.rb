require 'rails_helper'

RSpec.describe 'V1::Projects API', type: :request do
  include Docs::V1::Authentication::Api
  let(:user) { create(:user) }
  let(:invalid_user) { { username: '', password: '' } }

  describe 'POST /api/v1/auth/login' do
    it 'log in user', :dox do
      post api_v1_auth_login_path, params: { username: user.username, password: user.password }
      expect(response).to have_http_status(200)
    end

    it 'do not register user' do
      post api_v1_auth_login_path, params: invalid_user
      expect(response).to have_http_status(422)
      expect(response.body).to include('Couldn\'t find User')
    end
  end
end
