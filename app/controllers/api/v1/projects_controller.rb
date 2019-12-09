class Api::V1::ProjectsController < ApplicationController
  before_action :set_project

  def index
    @projects = Project.all

    render json: @projects, status: :ok
  end

  def show
    render json: @project, status: :ok
  end


  def create
    @project = Project.new(project_params)
    @project.save

    render json: @project, status: :created
  end

  def destroy
    return head(:ok) if @project.destroy

    head(:unprocessable_entity)
  end

  def update
    @project.update(project_params)

    render json: @project, status: :ok
  end

  private

  def project_params
    params.permit(:name)
  end

  def set_project
    @project = Project.find_by(id: params[:id])
  end
end
