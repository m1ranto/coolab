class AddAdminToCollaborators < ActiveRecord::Migration[7.0]
  def change
    add_column :collaborators, :admin, :boolean, default: false
  end
end
