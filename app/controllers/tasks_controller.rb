class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_task, only: [:show, :edit, :update, :destroy, :toggle]

  def index
    session[:hide] = (params[:hide] || session[:hide] || '1').to_i
    session[:sort] = params[:sort] || session[:sort] || ''
    @task  = current_user.tasks.new
    @tasks = current_user.tasks.reload
    @tasks = @tasks.order(session[:sort]) unless session[:sort].blank?
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(params[:task])
    if @task.save
      redirect_to root_path(reset: true), notice: 'Task added'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @task.update_attributes(params[:task])
      redirect_to root_path, notice: 'Task successfully updated'
      #respond_to do |format|
      #  format.html { redirect_to root_path, notice: 'Task successfully updated' }
      #  format.js   # update.js.erb
      #end
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
    redirect_to root_path, notice: 'Task successfully removed'
  end

  def toggle_visibility
    session[:hide] = (params[:hide] || 1).to_i
    render text: session[:hide]
  end

  private

  def find_task
    @task = current_user.tasks.find(params[:id])
  end

end