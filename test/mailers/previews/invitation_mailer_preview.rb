# Preview all emails at http://localhost:3000/rails/mailers/invitation_mailer
class InvitationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invitation_mailer/invite_collaborator
  def invite_collaborator
    InvitationMailer.invite_collaborator "to@example.org"
  end

end
