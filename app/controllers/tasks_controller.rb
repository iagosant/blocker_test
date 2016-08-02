class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    # byebug
    # @collaboration = Collaboration.find(3)
    # @user = @collaboration.user
    # @list = @collaboration.list
    # @tasks = @collaboration.tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    # byebug
    @collaboration = Collaboration.find(params[:collaboration_id])
    @task = @collaboration.tasks.new
  end

  # GET /tasks/1/edit
  def edit
    @collaboration = Colaboration.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    byebug
    @collaboration = Collaboration.find(params[:collaboration_id])
    @task = @collaboration.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @collaboration, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @collaboration }
      else
        format.html { render :new }
        format.json { render json: @collaboration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url}
# rename_column :table, :old_column, :new_column
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:detail, :task)
    end
end
