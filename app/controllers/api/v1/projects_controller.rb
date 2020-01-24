class Api::V1::ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: @projects, status: :ok
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
    return head(:ok) if @project.destroy

    head(:unprocessable_entity)
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
