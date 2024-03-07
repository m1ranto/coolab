module ApplicationHelper
  private

  def dropdown_edit(object)
    case
    when object.is_a?(Organization)  then edit_organization_path(object)
    when object.is_a?(Collaborator)  then edit_collaborator_path(object)
    when object.is_a?(Project)       then edit_project_path(object)
    when object.is_a?(Document)      then edit_project_document_path(object.project, object)
    when object.is_a?(Task)          then edit_project_task_path(object.project, object)
    when object.is_a?(Todo)          then edit_project_task_todo_path(object.task.project, object.task, object)
    end
  end

  def dropdown_delete(object)
    case
    when object.is_a?(Organization)  then object
    when object.is_a?(Collaborator)  then object
    when object.is_a?(Project)       then object
    when object.is_a?(Document)      then [object.project, object]
    when object.is_a?(Task)          then [object.project, object]
    when object.is_a?(Todo)          then [object.task.project, object.task, object]
    end
  end
end
