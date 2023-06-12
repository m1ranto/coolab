class AddOrganizationToCollaborators < ActiveRecord::Migration[7.0]
  def change
    add_reference :collaborators, :organization, foreign_key: true
  end
end
