RSpec.describe 'V1::Users API', type: :request do
  include Docs::V1::Users::Api

  let(:user_params) { attributes_for(:user) }

  describe 'POST /api/v1/users' do
    include Docs::V1::Users::Create
    let(:invalid_user) { { username: '', password: '', password_confirmation: '' } }

    it 'register new user', :dox do
      post api_v1_users_path, params: user_params, as: :json
      expect(response).to have_http_status(:created)
    end

    it 'do not create user', :dox do
      post api_v1_users_path, params: invalid_user, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
