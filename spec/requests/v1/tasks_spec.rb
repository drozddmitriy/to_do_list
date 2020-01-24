require 'rails_helper'

RSpec.describe 'V1::Tasks API', type: :request do
  include Docs::V1::Tasks::Api

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let!(:tasks) { create_list(:task, 3, project: project) }
  let(:task) { create(:task, project: project) }
  let(:task_params) { attributes_for(:task) }
  let(:headers) { { authorization: JsonWebToken.encode(user_id: user.id), accept: 'application/json' } }

  describe 'GET /api/v1/projects/:project_id/tasks' do
    include Docs::V1::Tasks::Index

    it 'get tasks', :dox do
      get api_v1_project_tasks_path(project), headers: headers
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body.size).to eq(3)
      expect(response).to match_json_schema('tasks')
    end
  end

  describe 'POST /api/v1/projects/:project_id/tasks' do
    include Docs::V1::Tasks::Create

    it 'create task', :dox do
      expect do
        post api_v1_project_tasks_path(project), headers: headers, params: task_params
      end.to change(Task, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(response).to match_json_schema('task')
    end
  end

  describe 'PUT /api/v1/tasks/:id' do
    include Docs::V1::Tasks::Edit
    let(:edite_task) { { name: 'Test_name' } }

    it 'update tasks', :dox do
      put api_v1_task_path(task), headers: headers, params: edite_task
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Test_name')
      expect(response).to match_json_schema('task')
    end
  end

  describe 'GET /api/v1/tasks/:id' do
    include Docs::V1::Tasks::Get

    it 'get task', :dox do
      get api_v1_task_path(task), headers: headers, params: task_params
      expect(response).to have_http_status(:ok)
      expect(response).to match_json_schema('task')
    end
  end

  describe 'DELETE /api/v1/tasks/:id' do
    include Docs::V1::Tasks::Delete

    it 'delete task', :dox do
      expect do
        delete api_v1_task_path(id: tasks.first.id), headers: headers
      end.to change(Task, :count).by(-1)

      expect(response).to have_http_status(:ok)
    end
  end
end
