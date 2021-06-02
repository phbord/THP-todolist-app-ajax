class HomeController < ApplicationController
  def index
    @tasks = Task.all
    @categories = Category.all
  end

  private

  def task_params
    params.permit(:title, :deadline, :category)
  end
end
