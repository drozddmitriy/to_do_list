module Api
  module V1
    class ProjectsController < ApplicationController
      load_and_authorize_resource

      def index
        render json: @projects
      end

      def show
        render json: @project, status: :ok
      end

      def create
        if @project.save
          render json: @project, status: :created
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      def destroy
        head(:no_content) if @project.destroy
      end

      def update
        if @project.update(project_params)
          render json: @project, status: :ok
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      private

      def project_params
        params.permit(:name)
      end
    end
  end
end
