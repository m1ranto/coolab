class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]

  # Get todos
  def index
    @todos = Todo.all
  end

  # Get todo
  def show
  end

  # Get new todo
  def new
    @todo = Todo.new
  end

  # Edit todo
  def edit
  end

  # Create todo
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todo_url(@todo), notice: "Todo was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # Update todo
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todo_url(@todo), notice: "Todo was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # Delete todo
  def destroy
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url, notice: "Todo was successfully destroyed." }
    end
  end

  private
    # Set todo
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:name, :description, :due_on, :done, :task_id)
    end
end
