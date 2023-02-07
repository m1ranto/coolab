class CreateCollaborators < ActiveRecord::Migration[7.0]
  def change
    create_table :collaborators do |t|
      t.string :name
      t.string :email
      t.string :title

      t.timestamps
    end
  end
end
