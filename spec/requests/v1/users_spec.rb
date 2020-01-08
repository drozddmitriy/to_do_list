require 'rails_helper'

RSpec.describe 'V1::Users', type: :request do
  include Docs::V1::Users::Api

  let(:user_params) { attributes_for(:user) }

  describe 'POST /api/v1/users' do
    include Docs::V1::Users::Create
    let(:invalid_user) { { username: '', password: '', password_confirmation: '' } }

    it 'register new user', :dox do
      post api_v1_users_path, params: user_params
      expect(response).to have_http_status(201)
    end

    it 'do not create user' do
      post api_v1_users_path, params: invalid_user
      expect(response).to have_http_status(422)
    end
  end
end
