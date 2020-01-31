module Api
  module V1
    class TasksController < ApplicationController
      load_and_authorize_resource

      def index
        render json: @tasks
      end

      def show
        render json: @task, status: :ok
      end

      def create
        if @task.save
          render json: @task, status: :created
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      def destroy
        head(:no_content) if @task.destroy
      end

      def update
        if @task.update(task_params)
          render json: @task, status: :ok
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      private

      def task_params
        params.permit(:name, :project_id, :complete, :deadline, :position)
      end
    end
  end
end
