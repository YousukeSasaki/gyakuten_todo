class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :done]
  before_action :set_categories, only: [:new, :create, :edit, :update]

  def index
    @done_tasks = Task.where(done: true).order('deadline asc')
    @not_yet_tasks = Task.where(done: false).order('deadline asc')
  end

  def new
    @task = Task.new
    @time = DateTime.now.strftime("%Y-%m-%dT%H:%M")
  end
  
  def create
    @task = Task.new(task_params)
    if @task.valid?
      @task.save
      flash[:notice] = "タスクを登録しました"
      redirect_to tasks_path
    else
      @time = DateTime.now.strftime("%Y-%m-%dT%H:%M") || params[:deadline]
      flash.now[:alert] = "タスクの登録に失敗しました"
      render :new
    end
  end
  
  def show; end
  
  def edit
    @time = @task.deadline.strftime("%Y-%m-%dT%H:%M")
  end
  
  def update
    @task.assign_attributes(task_params)
    if @task.valid?
      @task.save
      flash[:notice] = "タスクを更新しました"
      redirect_to root_path
    else
      @time = @task.deadline.strftime("%Y-%m-%dT%H:%M")
      flash.now[:alert] = "タスクの更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @task.delete
    flash[:notice] = "タスクを削除しました"
    redirect_to root_path
  end
  
  def done
    opposite_status = !@task.done
    @task.update(done: opposite_status)
    if opposite_status
      message = "タスクを完了にしました"
    else
      message = "タスクを元に戻しました"
    end
    flash[:notice] = message
    redirect_to root_path
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def task_params
    params.require(:task).permit(:title, :description, :deadline, :category_id)
  end
end
