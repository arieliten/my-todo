class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_task, only: [:show, :edit, :update, :destroy, :toggle]

  def index
    params[:hide_completed] = '1' unless params[:hide_completed]
    @task  = current_user.tasks.new
    @tasks = current_user.tasks.reload
    @tasks = @tasks.order(params[:sort]) if params[:sort]
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(params[:task])
    if @task.save
      redirect_to root_path(persisted_params.merge!({reset: true})), notice: 'Task added'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @task.update_attributes(params[:task])
      respond_to do |format|
        format.html { redirect_to root_path(persisted_params), notice: 'Task successfully updated' }
        format.js   # update.js.erb
      end
    else
      render action: 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path, notice: 'Task successfully removed'
  end

  def toggle
    @task.toggle!(:completed)
    respond_to do |format|
      format.html { redirect_to root_path(persisted_params), notice: 'Task status updated' }
      format.js   # toggle.js.erb
    end
  end


  private

  def find_task
    @task = current_user.tasks.find(params[:id])
  end

  def persisted_params
    { sort: params[:sort] || '', 
      hide_completed: params[:hide_completed] || false}
  end
end