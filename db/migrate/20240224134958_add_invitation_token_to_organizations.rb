class AddInvitationTokenToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :invitation_token, :string
  end
end
