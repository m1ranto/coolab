class AddPasswordDigestToCollaborators < ActiveRecord::Migration[7.0]
  def change
    add_column :collaborators, :password_digest, :string
  end
end
