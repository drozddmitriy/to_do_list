class Api::V1::ProjectsController < ApplicationController
  before_action :find_project, except: %i[create index]

  def index
    @projects = current_user.projects.all

    render json: @projects, status: :ok
  end

  def show
    render json: @project, status: :ok
  end


  def create
    @project = current_user.projects.build(project_params)

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
    params.permit(:name, :user_id)
  end

  def find_project
    @project = current_user.projects.find_by(id: params[:id])
  end
end
