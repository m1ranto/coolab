class InvitationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.send.subject
  #
  def invite_collaborator(email)
    mail to: email, subject: "Invitation to Coolab projects"
  end
end
