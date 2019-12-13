class Api::V1::CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_current_task
  before_action :find_comment, except: %i[create index]

  def index
    @comments = @task.comments

    render json: @comments, status: :ok
  end

  def show
    render json: @comment, status: :ok
  end

  def create
    @comment = @task.comments.build(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    return head(:ok) if @comment.destroy

    head(:unprocessable_entity)
  end

  private

  def comment_params
    params.permit(:text, :file, :task_id)
  end

  def set_current_task
    @task = current_user.projects.find_by(id: params[:project_id]).tasks.find_by(id: params[:task_id])
  end

  def find_comment
    @comment = @task.comments.find_by(id: params[:id])
  end
end
