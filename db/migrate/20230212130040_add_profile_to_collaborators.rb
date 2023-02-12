class AddProfileToCollaborators < ActiveRecord::Migration[7.0]
  def change
    add_column :collaborators, :profile, :string
  end
end
