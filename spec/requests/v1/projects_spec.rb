RSpec.describe 'V1::Projects API', type: :request do
  include Docs::V1::Projects::Api

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:headers) { { authorization: JsonWebToken.encode(user_id: user.id), accept: 'application/json' } }

  describe 'GET /api/v1/projects' do
    include Docs::V1::Projects::Index
    let(:projects) { create_list(:project, 3, user: user) }

    context 'with valid params' do
      before do
        projects
        get api_v1_projects_path, headers: headers
      end

      it 'returns a projects', :dox do
        expect(response.parsed_body.size).to eq(3)
      end

      it_behaves_like 'http status ok', 'projects'
    end

    context 'when user unauthorized' do
      let(:headers) { { authorization: nil, accept: 'application/json' } }

      before { get api_v1_projects_path, headers: headers }

      it 'returns an unauthorized status code', :dox do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when action is forbidden' do
      let(:user_forbidden) { create(:user, username: 'test12') }
      let(:headers) { { authorization: JsonWebToken.encode(user_id: user_forbidden.id), accept: 'application/json' } }

      before { put api_v1_project_path(project), headers: headers }

      it 'returns a forbidden status code', :dox do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'POST /api/v1/projects' do
    include Docs::V1::Projects::Create

    context 'with valid params' do
      let(:project_params) { attributes_for(:project) }

      it 'creates a new project', :dox do
        expect { post api_v1_projects_path, headers: headers, params: project_params, as: :json }
          .to change(Project, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(response).to match_json_schema('project')
      end
    end

    context 'with invalid params' do
      let(:project_params) { { name: nil } }

      before { post api_v1_projects_path, headers: headers, params: project_params, as: :json }

      it 'returns unprocessable entity', :dox do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when user unauthorized' do
      let(:headers) { { authorization: nil, accept: 'application/json' } }
      let(:project_params) { attributes_for(:project) }

      before { post api_v1_projects_path, headers: headers, params: project_params, as: :json }

      it 'returns an unauthorized status code', :dox do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'PUT /api/v1/projects/:id' do
    include Docs::V1::Projects::Edit

    context 'with valid params' do
      let(:edited_params) { { name: 'Test_name' } }

      before { put api_v1_project_path(project), headers: headers, params: edited_params, as: :json }

      it 'updates the project', :dox do
        expect(response.body).to include('Test_name')
      end

      it_behaves_like 'http status ok', 'project'
    end

    context 'with invalid params' do
      let(:project_params) { { name: nil } }

      before { put api_v1_project_path(project), headers: headers, params: project_params, as: :json }

      it 'returns unprocessable entity', :dox do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when user unauthorized' do
      let(:headers) { { authorization: nil, accept: 'application/json' } }
      let(:project_params) { attributes_for(:project) }

      before { put api_v1_project_path(project), headers: headers, params: project_params }

      it 'returns an unauthorized status code', :dox do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when action is forbidden' do
      let(:user_forbidden) { create(:user, username: 'test1') }
      let(:headers) { { authorization: JsonWebToken.encode(user_id: user_forbidden.id), accept: 'application/json' } }
      let(:project_params) { attributes_for(:project) }

      before { put api_v1_project_path(project), headers: headers, params: project_params, as: :json }

      it 'returns a forbidden status code', :dox do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'GET /api/v1/projects/:id' do
    include Docs::V1::Projects::Get
    context 'with valid id', :dox do
      let(:project_params) { attributes_for(:project) }

      before { get api_v1_project_path(project), headers: headers }

      it_behaves_like 'http status ok', 'project'
    end

    context 'with invalid id', :dox do
      before { get api_v1_project_path(id: 0), headers: headers }

      it_behaves_like 'http status not_found'
    end

    context 'when user unauthorized' do
      let(:headers) { { authorization: nil, accept: 'application/json' } }

      before { get api_v1_project_path(project), headers: headers }

      it 'returns an unauthorized status code', :dox do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when action is forbidden' do
      let(:user_forbidden) { create(:user, username: 'test2') }
      let(:headers) { { authorization: JsonWebToken.encode(user_id: user_forbidden.id), accept: 'application/json' } }

      before { get api_v1_project_path(project), headers: headers }

      it 'returns a forbidden status code', :dox do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'DELETE /api/v1/projects/:id' do
    include Docs::V1::Projects::Delete
    let(:projects) { create_list(:project, 3, user: user) }

    context 'with valid id' do
      it 'deletes the project', :dox do
        projects
        expect { delete api_v1_project_path(id: projects.first.id), headers: headers }.to change(Project, :count).by(-1)
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'with invalid id', :dox do
      before { delete api_v1_project_path(id: 0), headers: headers }

      it_behaves_like 'http status not_found'
    end

    context 'when user unauthorized' do
      let(:headers) { { authorization: nil, accept: 'application/json' } }

      before { delete api_v1_project_path(id: projects.first.id), headers: headers }

      it 'returns an unauthorized status code', :dox do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when action is forbidden' do
      let(:user_forbidden) { create(:user, username: 'test3') }
      let(:headers) { { authorization: JsonWebToken.encode(user_id: user_forbidden.id), accept: 'application/json' } }

      before { delete api_v1_project_path(id: projects.first.id), headers: headers }

      it 'returns a forbidden status code', :dox do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
