require 'rails_helper'

RSpec.describe InvitationMailer, type: :mailer do
  it 'delivers invitation email', :aggregate_failures do
    mail = InvitationMailer.invite_collaborator('to@example.com')
    expect(mail.subject).to include('Invitation')
    expect(mail.from).to eq(['from@example.com'])
    expect(mail.to).to eq(['to@example.com'])
    expect(mail.body.encoded).to include('you have been invited')
  end
end