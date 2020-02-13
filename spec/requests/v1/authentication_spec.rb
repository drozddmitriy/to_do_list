RSpec.describe 'V1::Authentications API', type: :request do
  include Docs::V1::Authentications::Api

  describe 'POST /api/v1/authentications' do
    include Docs::V1::Authentications::Create
    let(:user) { create(:user) }
    let(:invalid_user) { { username: user.username, password: '' } }

    it 'login user', :dox do
      post api_v1_authentications_path, params: { username: user.username, password: user.password }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(user.username)
    end

    it 'do not register user', :dox do
      post api_v1_authentications_path, params: invalid_user
      expect(response).to have_http_status(:unauthorized)
      expect(response.body).to include(I18n.t('errors.messages.authentications_error'))
    end
  end

  describe 'DELETE /api/v1/authentications' do
    include Docs::V1::Authentications::Delete
    let(:user) { create(:user) }
    let(:headers) { { authorization: JsonWebToken.encode(user_id: user.id), accept: 'application/json' } }

    it 'logout user', :dox do
      delete api_v1_authentications_path, headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end
end
