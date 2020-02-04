module Api
  module V1
    class CommentsController < ApplicationController
      load_and_authorize_resource :task
      load_and_authorize_resource :comment, through: :task, shallow: true

      def index
        render json: @comments
      end

      def create
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        head(:no_content) if @comment.destroy
      end

      private

      def comment_params
        params.permit(:text, :file, :task_id)
      end
    end
  end
end
