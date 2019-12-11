class Api::V1::ProjectsController < ApplicationController
  before_action :find_project, except: %i[create index]

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
    if @project.update(project_params)
      render json: @project, status: :ok
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.permit(:name, :user_id)
  end

  def find_project
    @project = Project.find_by(id: params[:id])
  end
end
