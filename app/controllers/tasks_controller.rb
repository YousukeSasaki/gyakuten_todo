class TasksController < ApplicationController

  before_action :set_task only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all.order('id desc').limit(10)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.valid?
      @task.save
      # redirect_to 
    else
      render :new
    end
  end

  def show; end
  
  def edit; end
  
  def update
    if @task.valid?
      @task.update
      # redirect_to
    else
      render :new
    end
  end
  
  def destroy
    @task.delete
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit!
  end
end
