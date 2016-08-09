class TasksController < ApplicationController

  before_action :set_task, except: [:create]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = @list.tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit

  end

  def complete
		@task.update_attribute(:completed_at, Time.now)
		redirect_to @list, notice: "Todo item completed"
	end

  # POST /tasks
  # POST /tasks.json
  def create
    # byebug
    @list = List.find(params[:list_id])
    @task = @list.tasks.build(task_params)
    # byebug
    if !task_params[:user_id]
      # current user
      @user = User.find(1)
      @task.update(user_id:@user.id)
    end
    respond_to do |format|
      if @task.save
        format.html { redirect_to @list, notice: 'Task was successfully created.' }
        format.json
      else
        format.html { render :new }
        format.json
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
    if @task.destroy
			flash[:success] = "Todo List item was deleted."
		else
			flash[:error] = "Todo List item could not be deleted."
		end
		redirect_to @todo_list

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_list
    #
		#   @list = List.find(params[:list_id])
	  # end

    def set_task
      @task = @list.tasks.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:detail, :list_id, :user_id,)
    end
end
