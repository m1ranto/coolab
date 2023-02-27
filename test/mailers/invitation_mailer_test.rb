require "test_helper"

class InvitationMailerTest < ActionMailer::TestCase
  test "invite collaborator" do
    mail = InvitationMailer.invite_collaborator("to@example.org")
    assert_equal "Invitation to Coolab projects", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
  end

end
