module TodosHelper
  private
  attr_reader :todos, :todo

  def arrows_todo(todos, todo)
    index = todos.find_index(todo)
    previous_todo(index.pred) + " " + next_todo(index.next) + " " + todo_indexes(index)
  end

  def previous_todo(index)
    if index >= 0
      link_to "", project_task_todo_path(todo.task.project, todo.task, todos[index]), class: "bi bi-chevron-up arrow", title: "Navigate up K", data: { controller: "arrow", action: "keydown.k@document->arrow#up" }
    else
      link_to "", "#", class: "bi bi-chevron-up arrow disable"
    end
  end

  def next_todo(index)
    if index < todos.size
      link_to "", project_task_todo_path(todo.task.project, todo.task, todos[index]), class: "bi bi-chevron-down arrow", title: "Navigate down J", data: { controller: "arrow", action: "keydown.j@document->arrow#down" }
    else
      link_to "", "#", class: "bi bi-chevron-down arrow disable"
    end
  end

  def todo_indexes(index)
    content_tag :span, "#{index+1}/#{todos.size}", class: "text-gray-600 ms-1"
  end

  def priority_icon(todo)
    case todo.priority
    when "Urgent" then "bi bi-exclamation-square-fill text-orange-500 mx-1"
    when "High" then "bi bi-reception-4 mx-1"
    when "Medium" then "bi bi-reception-3 mx-1"
    when "Low" then "bi bi-reception-2 mx-1"
    else ""
    end
  end
end
