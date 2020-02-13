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

    context 'with valid task_id', :dox do
      before { get api_v1_task_comments_path(task_id: task.id), headers: headers } ####json true??????

      it { expect(response.parsed_body.size).to eq(3) }

      it_behaves_like 'http status ok', 'comments'
    end

    context 'with invalid task_id', :dox do
      before { get api_v1_task_comments_path(task_id: 0), headers: headers }

      it_behaves_like 'http status not_found'
    end
  end

  describe 'POST /api/v1/tasks/:task_id/comments' do
    include Docs::V1::Comments::Create

    context 'with valid params', :dox do
      before { post api_v1_task_comments_path(task), headers: headers, params: comment_params }

      it do
        expect(response).to have_http_status(:created)
        expect(response).to match_json_schema('comment')
      end
    end

    context 'with invalid params', :dox do
      let(:params) { { text: nil } }

      before { post api_v1_task_comments_path(task), headers: headers, params: params }

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe 'DELETE /api/v1/tasks/:task_id/comments/:id' do
    include Docs::V1::Comments::Delete

    context 'with valid id', :dox do
      before { delete api_v1_comment_path(id: comments.first.id), headers: headers }

      it { expect(response).to have_http_status(:no_content) }
    end

    context 'with invalid id', :dox do
      before { delete api_v1_comment_path(id: 0), headers: headers }

      it_behaves_like 'http status not_found'
    end
  end
end
