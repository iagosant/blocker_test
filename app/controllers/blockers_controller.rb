class BlockersController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
    byebug
    @task = Task.find(params[:task_id])
    # @blocker = @task.blockers.new
    @blocker = @task.blockers.new(params[:detail])
    redirect_to task_path(@task)

  end

  def create
    # @blocker = @task.blockers.new(params[:detail])
    # @task = Task.find(@blocker.parent_task_id)
    byebug
    # @blocker.save
    # redirect_to @task
  end

  def edit

  end

  private
  def task_params
    params.require(:blocker).permit(:user, :list)
  end
end
