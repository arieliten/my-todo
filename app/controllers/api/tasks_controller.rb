class Api::TasksController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!
  before_filter :find_task, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @tasks = current_user.tasks
    respond_with @tasks
  end

  def show
    respond_with @task
  end

  def create
    @task = current_user.tasks.new(params[:task])
    if @task.save
      respond_with(@task, location: api_task_path(@task))
    else
      respond_with(@task)
    end
  end

  def update
    @task.update_attributes(params[:task])
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private

  def find_task
    @task = current_user.tasks.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      error = { error: "The task you were looking for could not be found" }
      render json: error, status: 404
  end
end