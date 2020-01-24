class Api::V1::TasksController < ApplicationController
  load_and_authorize_resource

  def index
    render json: @tasks, status: :ok
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
    return head(:ok) if @task.destroy

    head(:unprocessable_entity)
  end

  def update
    position(params[:move]) if params[:move]

    if @task.update(task_params)
      render json: @task, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.permit(:name, :project_id, :complete, :deadline)
  end

  def position(move)
    case move
    when 'up' then @task.move_higher
    when 'down' then @task.move_lower
    else false
    end
  end
end
