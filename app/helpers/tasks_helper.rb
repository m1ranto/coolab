module TasksHelper
  private
  attr_reader :tasks, :task

  def arrows_task(tasks, task)
    index = tasks.find_index(task)
    previous_task(index.pred) + " " + next_task(index.next) + " " + task_indexes(index)
  end

  def previous_task(index)
    if index >= 0
      link_to "", project_task_path(task.project, tasks[index]), class: "bi bi-chevron-up arrow", title: "Navigate up K", data: { controller: "arrow", action: "keydown.k@document->arrow#up" }
    else
      link_to "", "#", class: "bi bi-chevron-up arrow disable"
    end
  end

  def next_task(index)
    if index < tasks.size
      link_to "", project_task_path(task.project, tasks[index]), class: "bi bi-chevron-down arrow", title: "Navigate down J", data: { controller: "arrow", action: "keydown.j@document->arrow#down" }
    else
      link_to "", "#", class: "bi bi-chevron-down arrow disable"
    end
  end

  def task_indexes(index)
    content_tag :span, "#{index+1}/#{tasks.size}", class: "text-secondary ms-1"
  end
end
