class CreateCollaboratorsTodosJoin < ActiveRecord::Migration[7.0]
  def change
    create_table :collaborators_todos, id: false do |t|
      t.integer "collaborator_id"
      t.integer "todo_id"

      t.timestamps
    end
    add_index("collaborators_todos", ["collaborator_id", "todo_id"])
  end
end
