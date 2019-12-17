require 'rails_helper'

RSpec.describe 'V1::Comments API', type: :request do
  include Docs::V1::Comments::Api

  let(:user) { create(:user) }
  let(:project) { create(:project, user_id: user.id) }
  let(:task) { create(:task, project_id: project.id) }
  let!(:comments) { create_list(:comment, 3, task_id: task.id) }
  let(:comment) { create(:comment, task_id: task.id) }
  let(:comment_params) { attributes_for(:comment) }
  let(:headers) { { authorization: JsonWebToken.encode(user_id: user.id), accept: 'application/json' } }

  describe 'GET /api/v1/projects/:project_id/tasks/:task_id/comments' do
    include Docs::V1::Comments::Index

    it 'get comments', :dox do
      get api_v1_project_task_comments_path(project_id: project.id, task_id: task.id), headers: headers
      expect(response).to have_http_status(200)
      expect(response.parsed_body.size).to eq(3)
    end
  end

  describe 'POST /api/v1/projects/:project_id/tasks/:task_id/comments' do
    include Docs::V1::Comments::Create

    it 'create comment', :dox do
      expect do
        post api_v1_project_task_comments_path(project_id: project.id, task_id: task.id), headers: headers,
                                                                                          params: comment_params
      end.to change(Comment, :count).by(1)

      expect(response).to have_http_status(201)
    end
  end

  describe 'PUT /api/v1/projects/:project_id/tasks/:task_id/comments/:id' do
    include Docs::V1::Comments::Edit
    let(:edited_comment) { { text: 'Test_text' } }

    it 'update comment', :dox do
      put api_v1_project_task_comment_path(project_id: project.id, task_id: task.id, id: comment.id), headers: headers,
                                                                                                      params: edited_comment
      expect(response).to have_http_status(200)
      expect(response.body).to include('Test_text')
    end
  end

  describe 'GET /api/v1/projects/:project_id/tasks/:task_id/comments/:id', :dox do
    include Docs::V1::Comments::Get

    it 'get comment' do
      get api_v1_project_task_comment_path(project_id: project.id, task_id: task.id, id: comment.id), headers: headers,
                                                                                                      params: comment_params
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /api/v1/projects/:project_id/tasks/:task_id/comments/:id', :dox do
    include Docs::V1::Comments::Delete

    it 'delete comments' do
      expect do
        delete api_v1_project_task_comment_path(project_id: project.id, task_id: task.id, id: comments.first.id), headers: headers
      end.to change(Comment, :count).by(-1)
      expect(response).to have_http_status(200)
    end
  end
end
