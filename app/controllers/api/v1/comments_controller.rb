class Api::V1::CommentsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: @comments, status: :ok
  end

  def create
    if @comment.save
      render json: @comment, status: :created
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
end
