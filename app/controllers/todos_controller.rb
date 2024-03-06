class TodosController < ApplicationController
  before_action :get_task, except: :activity
  before_action :set_todo, only: %i[ show edit update done assign destroy ]
  before_action :logged_in_collaborator
  before_action :get_collaborators, only: %i[ create update ]

  include SessionsHelper

  # Get todo
  def show
    @todos = @task.todos
  end

  def activity
  end

  # Get new todo
  def new
    @todo = @task.todos.build
  end

  # Edit todo
  def edit
  end

  # Create todo
  def create
    @todo = @task.todos.build(todo_params)
    @todo.collaborators = @collaborators

    respond_to do |format|
      if @todo.save
        format.html { redirect_to project_task_todo_url(@task.project, @task, @todo), notice: "Todo was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # Update todo
  def update
    @todo.collaborators = @collaborators

    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to project_task_todo_url(@task.project, @task, @todo), notice: "Todo was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # Done todo
  def done
    @todo.done = @todo.done ? false : true
    @todo.save

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@task, @task) }
      format.html { redirect_back_or_to project_task_todo_url(@task.project, @task, @todo) }
    end
  end

  # Done todo
  def assign
    @todo.done = true
    @todo.save

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@todo) }
      format.html { redirect_back_or_to project_task_todo_url(@task.project, @task, @todo) }
    end
  end

  # Delete todo
  def destroy
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to project_task_url(@task.project, @task), notice: "Todo was successfully destroyed." }
    end
  end

  private
    # Set todo
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:name, :description, :due_on, :done, :task_id, :priority)
    end

    # Get collaborators
    def get_collaborators
      @collaborators = []
      collaborator_ids = params[:todo][:collaborator]
      collaborator_ids&.each do |collaborator_id|
        @collaborators << Collaborator.find(collaborator_id) unless collaborator_id.empty?
      end
      @collaborators
    end

    # Get task
    def get_task
      @task = Task.find(params[:task_id])
    end
end
