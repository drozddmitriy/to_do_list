require 'rails_helper'

RSpec.describe 'V1::Projects API', type: :request do
  include Docs::V1::Projects::Api

  let(:user) { create(:user) }
  let!(:projects) { create_list(:project, 3, user: user) }
  let(:project) { create(:project, user: user) }
  let(:project_params) { attributes_for(:project) }
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

    it 'create project', :dox do
      expect { post api_v1_projects_path, headers: headers, params: project_params }.to change(Project, :count).by(1)
      expect(response).to have_http_status(:created)
      expect(response).to match_json_schema('project')
    end
  end

  describe 'PUT /api/v1/projects/:id' do
    include Docs::V1::Projects::Edit
    let(:edited_params) { { name: 'Test_name' } }

    it 'edit project', :dox do
      put api_v1_project_path(project), headers: headers, params: edited_params
      expect(response.body).to include('Test_name')
      expect(response).to have_http_status(:ok)
      expect(response).to match_json_schema('project')
    end
  end

  describe 'GET /api/v1/projects/:id' do
    include Docs::V1::Projects::Get

    it 'get project', :dox do
      get api_v1_project_path(project), headers: headers, params: project_params
      expect(response).to have_http_status(:ok)
      expect(response).to match_json_schema('project')
    end
  end

  describe 'DELETE /api/v1/projects/:id' do
    include Docs::V1::Projects::Delete

    it 'delete project', :dox do
      expect { delete api_v1_project_path(id: projects.first.id), headers: headers }.to change(Project, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
