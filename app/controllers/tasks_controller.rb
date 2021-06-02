class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end

  def create
    @flash = "Task created"
    @task = Task.new(task_params)
    @category = Category.find(category_params)
    @task.category = @category
    puts "*"*40
    p @category
    p @task.category
    puts "*"*40
    @task.save

    respond_to do |format|
      format.html {
        redirect_to root_path
        flash[:notice] = @flash
      }
      format.js {}
    end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all
  end

  def update
    @flash = "Task edited"
    @task = Task.find(params[:id])
    @task.status = params[:status]
    @task.update(task_params)

    respond_to do |format|
      format.html {
        redirect_to tasks_path
        flash[:notice] = @flash
      }
      format.js { }
    end
  end

  def index
    @tasks = Task.all
  end

  def destroy
    @flash = "Task deleted"
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html {
        redirect_to root_path
        flash[:notice] = @flash
      }
      format.js { }
    end
  end

  private

  def task_params
    params.permit(:title, :deadline, :description)
  end

  def category_params
    params.require(:Category)
  end

end
