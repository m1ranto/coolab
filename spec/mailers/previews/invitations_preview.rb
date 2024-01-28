# Preview all emails at http://localhost:3000/rails/mailers/invitations
class InvitationsPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/invitations/invite_collaborator
  def invite_collaborator
    InvitationMailer.invite_collaborator('to@example.com')
  end
end