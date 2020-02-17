RSpec.describe 'V1::Tasks API', type: :request do
  include Docs::V1::Tasks::Api

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:headers) { { authorization: JsonWebToken.encode(user_id: user.id), accept: 'application/json' } }

  describe 'GET /api/v1/projects/:project_id/tasks' do
    include Docs::V1::Tasks::Index
    let(:tasks) { create_list(:task, 3, project: project) }

    context 'with valid project_id' do
      before do
        tasks
        get api_v1_project_tasks_path(project), headers: headers
      end

      it 'returns a tasks', :dox do
        expect(response.parsed_body.size).to eq(3)
      end

      it_behaves_like 'http status ok', 'tasks'
    end

    context 'with invalid project_id' do
      before { get api_v1_project_tasks_path(project_id: 0), headers: headers }

      it_behaves_like 'http status not_found'
    end

    context 'when user unauthorized' do
      let(:headers) { { authorization: nil, accept: 'application/json' } }

      before { get api_v1_project_tasks_path(project), headers: headers }

      it 'returns an unauthorized status code', :dox do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when action is forbidden' do
      let(:user_forbidden) { create(:user, username: 'test12') }
      let(:headers) { { authorization: JsonWebToken.encode(user_id: user_forbidden.id), accept: 'application/json' } }

      before { get api_v1_project_tasks_path(project), headers: headers }

      it 'returns a forbidden status code', :dox do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'POST /api/v1/projects/:project_id/tasks' do
    include Docs::V1::Tasks::Create

    context 'with valid params' do
      let(:task_params) { attributes_for(:task) }

      it 'creates a new task', :dox do
        expect do
          post api_v1_project_tasks_path(project), headers: headers, params: task_params, as: :json
        end.to change(Task, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(response).to match_json_schema('task')
      end
    end

    context 'with invalid params' do
      let(:task_params) { { name: nil } }

      before { post api_v1_project_tasks_path(project), headers: headers, params: task_params, as: :json }

      it 'returns unprocessable entity', :dox do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when user unauthorized' do
      let(:task_params) { attributes_for(:task) }
      let(:headers) { { authorization: nil, accept: 'application/json' } }

      before { post api_v1_project_tasks_path(project), headers: headers, params: task_params, as: :json }

      it 'returns an unauthorized status code', :dox do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when action is forbidden' do
      let(:task_params) { attributes_for(:task) }
      let(:user_forbidden) { create(:user, username: 'test1') }
      let(:headers) { { authorization: JsonWebToken.encode(user_id: user_forbidden.id), accept: 'application/json' } }

      before { post api_v1_project_tasks_path(project), headers: headers, params: task_params, as: :json }

      it 'returns a forbidden status code', :dox do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'PUT /api/v1/tasks/:id' do
    include Docs::V1::Tasks::Edit
    let(:task) { create(:task, project: project) }

    context 'with valid params' do
      let(:edite_task) { { name: 'Test_name' } }

      before { put api_v1_task_path(task), headers: headers, params: edite_task, as: :json }

      it 'updates the task', :dox do
        expect(response.body).to include(edite_task[:name])
      end

      it_behaves_like 'http status ok', 'task'
    end

    context 'with invalid params' do
      let(:task_params) { { name: nil } }

      before { put api_v1_task_path(task), headers: headers, params: task_params, as: :json }

      it 'returns unprocessable entity', :dox do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when user unauthorized' do
      let(:task_params) { attributes_for(:task) }
      let(:headers) { { authorization: nil, accept: 'application/json' } }

      before { put api_v1_task_path(task), headers: headers, params: task_params, as: :json }

      it 'returns an unauthorized status code', :dox do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when action is forbidden' do
      let(:edite_task) { { name: 'Test_name' } }
      let(:user_forbidden) { create(:user, username: 'test23') }
      let(:headers) { { authorization: JsonWebToken.encode(user_id: user_forbidden.id), accept: 'application/json' } }

      before { put api_v1_task_path(task), headers: headers, params: edite_task, as: :json }

      it 'returns a forbidden status code', :dox do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'GET /api/v1/tasks/:id' do
    include Docs::V1::Tasks::Get
    let(:task) { create(:task, project: project) }

    context 'with valid id', :dox do
      before { get api_v1_task_path(task), headers: headers }

      it_behaves_like 'http status ok', 'task'
    end

    context 'with invalid id', :dox do
      before { get api_v1_task_path(id: 0), headers: headers }

      it_behaves_like 'http status not_found'
    end

    context 'when user unauthorized' do
      let(:headers) { { authorization: nil, accept: 'application/json' } }

      before { get api_v1_task_path(task), headers: headers }

      it 'returns an unauthorized status code', :dox do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when action is forbidden' do
      let(:user_forbidden) { create(:user, username: 'test3') }
      let(:headers) { { authorization: JsonWebToken.encode(user_id: user_forbidden.id), accept: 'application/json' } }

      before { get api_v1_task_path(task), headers: headers }

      it 'returns a forbidden status code', :dox do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'DELETE /api/v1/tasks/:id' do
    include Docs::V1::Tasks::Delete
    let(:task) { create(:task, project: project) }

    context 'with valid id' do
      it 'deletes the task', :dox do
        task
        expect do
          delete api_v1_task_path(task), headers: headers
        end.to change(Task, :count).by(-1)

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'with invalid id', :dox do
      before { delete api_v1_task_path(id: 0), headers: headers }

      it_behaves_like 'http status not_found'
    end

    context 'when user unauthorized' do
      let(:headers) { { authorization: nil, accept: 'application/json' } }

      before { delete api_v1_task_path(task), headers: headers }

      it 'returns an unauthorized status code', :dox do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when action is forbidden' do
      let(:user_forbidden) { create(:user, username: 'test4') }
      let(:headers) { { authorization: JsonWebToken.encode(user_id: user_forbidden.id), accept: 'application/json' } }

      before { delete api_v1_task_path(task), headers: headers }

      it 'returns a forbidden status code', :dox do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
