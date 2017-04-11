class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
  end

  def edit
  end

  def create
    @task = Task.new(tasks_params)
    @task.save
    redirect_to task_path(@task)
  end

  def update
    @task.update(tasks_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def set_task
      @task = Task.find(params[:id])
  end

  def tasks_params
      # *Strong params*: You need to *whitelist* what can be updated by the user
      # Never trust user data!
      params.require(:task).permit(:name, :description, :done)
  end
end
