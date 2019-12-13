class Api::V1::TasksController < ApplicationController
  load_and_authorize_resource
  before_action :set_current_project
  before_action :find_task, except: %i[create index]

  def index
    @tasks = @project.tasks

    render json: @tasks, status: :ok
  end

  def show
    render json: @task, status: :ok
  end

  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    return head(:ok) if @task.destroy

    head(:unprocessable_entity)
  end

  def update
    set_position(params[:move]) if params[:move]

    if @task.update(task_params)
      render json: @task, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  def set_current_project
    @project = current_user.projects.find_by(id: params[:project_id])
  end

  def find_task
    @task = @project.tasks.find_by(id: params[:id])
  end

  def task_params
    params.permit(:name, :project_id, :complete, :deadline)
  end

  def set_position(move)
    case move
    when 'up' then @task.move_higher
    when 'down' then @task.move_lower
    else false
    end
  end
end
