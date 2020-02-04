RSpec.describe 'V1::Tasks API', type: :request do
  include Docs::V1::Tasks::Api
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let!(:tasks) { create_list(:task, 3, project: project) }

  let(:headers) { { authorization: JsonWebToken.encode(user_id: user.id), accept: 'application/json' } }

  describe 'GET /api/v1/projects/:project_id/tasks' do
    include Docs::V1::Tasks::Index

    context 'with valid project_id', :dox do
      it do
        get api_v1_project_tasks_path(project), headers: headers
        expect(response).to have_http_status(:ok)
        expect(response.parsed_body.size).to eq(3)
        expect(response).to match_json_schema('tasks')
      end
    end

    context 'with invalid project_id' do
      before { get api_v1_project_tasks_path(project_id: 0), headers: headers }

      it_behaves_like 'http status not_found'
    end
  end

  describe 'POST /api/v1/projects/:project_id/tasks' do
    include Docs::V1::Tasks::Create

    context 'with valid params', :dox do
      let(:task_params) { attributes_for(:task) }

      it do
        expect do
          post api_v1_project_tasks_path(project), headers: headers, params: task_params
        end.to change(Task, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(response).to match_json_schema('task')
      end
    end

    context 'with invalid params', :dox do
      let(:task_params) { { name: nil } }

      before { post api_v1_project_tasks_path(project), headers: headers, params: task_params }

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe 'PUT /api/v1/tasks/:id' do
    include Docs::V1::Tasks::Edit
    let(:task) { create(:task, project: project) }

    context 'with valid params', :dox do
      let(:edite_task) { { name: 'Test_name' } }

      it do
        put api_v1_task_path(task), headers: headers, params: edite_task
        expect(response).to have_http_status(:ok)
        expect(response.body).to include(edite_task[:name])
        expect(response).to match_json_schema('task')
      end
    end

    context 'with invalid params', :dox do
      let(:task_params) { { name: nil } }

      before { put api_v1_task_path(task), headers: headers, params: task_params }

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe 'GET /api/v1/tasks/:id' do
    include Docs::V1::Tasks::Get
    let(:task) { create(:task, project: project) }

    context 'with valid id', :dox do
      let(:task_params) { attributes_for(:task) }

      it do
        get api_v1_task_path(task), headers: headers, params: task_params
        expect(response).to have_http_status(:ok)
        expect(response).to match_json_schema('task')
      end
    end

    context 'with invalid id', :dox do
      before { get api_v1_task_path(id: 0), headers: headers }

      it_behaves_like 'http status not_found'
    end
  end

  describe 'DELETE /api/v1/tasks/:id' do
    include Docs::V1::Tasks::Delete

    context 'with valid id', :dox do
      it do
        expect do
          delete api_v1_task_path(id: tasks.first.id), headers: headers
        end.to change(Task, :count).by(-1)

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'with invalid id', :dox do
      before { delete api_v1_task_path(id: 0), headers: headers }

      it_behaves_like 'http status not_found'
    end
  end
end
