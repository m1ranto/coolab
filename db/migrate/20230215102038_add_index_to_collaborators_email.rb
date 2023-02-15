class AddIndexToCollaboratorsEmail < ActiveRecord::Migration[7.0]
  def change
    add_index :collaborators, :email, unique: true
  end
end
