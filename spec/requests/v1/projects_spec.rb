RSpec.describe 'V1::Projects API', type: :request do
  include Docs::V1::Projects::Api

  let(:user) { create(:user) }
  let!(:projects) { create_list(:project, 3, user: user) }
  let(:project) { create(:project, user: user) }
  let(:headers) { { authorization: JsonWebToken.encode(user_id: user.id), accept: 'application/json' } }

  describe 'GET /api/v1/projects' do
    include Docs::V1::Projects::Index

    it 'get projects', :dox do
      get api_v1_projects_path, headers: headers
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body.size).to eq(3)
      expect(response).to match_json_schema('projects')
    end
  end

  describe 'POST /api/v1/projects' do
    include Docs::V1::Projects::Create

    context 'with valid params', :dox do
      let(:project_params) { attributes_for(:project) }

      it do
        expect { post api_v1_projects_path, headers: headers, params: project_params }.to change(Project, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(response).to match_json_schema('project')
      end
    end

    context 'with invalid params', :dox do
      let(:project_params) { { name: nil } }

      before { post api_v1_projects_path, headers: headers, params: project_params }

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe 'PUT /api/v1/projects/:id' do
    include Docs::V1::Projects::Edit

    context 'with valid params', :dox do
      let(:edited_params) { { name: 'Test_name' } }

      it do
        put api_v1_project_path(project), headers: headers, params: edited_params
        expect(response.body).to include('Test_name')
        expect(response).to have_http_status(:ok)
        expect(response).to match_json_schema('project')
      end
    end

    context 'with invalid params', :dox do
      let(:project_params) { { name: nil } }

      before { put api_v1_project_path(project), headers: headers, params: project_params }

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe 'GET /api/v1/projects/:id' do
    include Docs::V1::Projects::Get
    context 'with valid id', :dox do
      let(:project_params) { attributes_for(:project) }

      it do
        get api_v1_project_path(project), headers: headers, params: project_params
        expect(response).to have_http_status(:ok)
        expect(response).to match_json_schema('project')
      end
    end

    context 'with invalid id', :dox do
      before { get api_v1_project_path(id: 0), headers: headers }

      it_behaves_like 'http status not_found'
    end
  end

  describe 'DELETE /api/v1/projects/:id' do
    include Docs::V1::Projects::Delete

    context 'with valid id', :dox do
      it do
        expect { delete api_v1_project_path(id: projects.first.id), headers: headers }.to change(Project, :count).by(-1)
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'with invalid id', :dox do
      before { delete api_v1_comment_path(id: 0), headers: headers }

      it_behaves_like 'http status not_found'
    end
  end
end
