RSpec.describe 'V1::Comments API', type: :request do
  include Docs::V1::Comments::Api

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }
  let!(:comments) { create_list(:comment, 3, task: task) }
  let(:comment) { create(:comment, task: task) }
  let(:comment_params) { attributes_for(:comment) }
  let(:headers) { { authorization: JsonWebToken.encode(user_id: user.id), accept: 'application/json' } }

  describe 'GET /api/v1/tasks/:task_id/comments' do
    include Docs::V1::Comments::Index

    before { get api_v1_task_comments_path(task_id: task.id), headers: headers }

    it 'get comments', :dox do
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body.size).to eq(3)
      expect(response).to match_json_schema('comments')
    end
  end

  describe 'POST /api/v1/tasks/:task_id/comments' do
    include Docs::V1::Comments::Create

    before { post api_v1_task_comments_path(task), headers: headers, params: comment_params }

    it 'create comment', :dox do
      expect(response).to have_http_status(:created)
      expect(response).to match_json_schema('comment')
    end
  end

  describe 'DELETE /api/v1/tasks/:task_id/comments/:id', :dox do
    include Docs::V1::Comments::Delete

    before { delete api_v1_comment_path(id: comments.first.id), headers: headers }

    it 'delete comments' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
