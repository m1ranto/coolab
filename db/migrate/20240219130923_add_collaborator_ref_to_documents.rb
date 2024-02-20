class AddCollaboratorRefToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents, :collaborator, foreign_key: true
  end
end
