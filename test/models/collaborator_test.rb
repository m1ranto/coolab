require "test_helper"

class CollaboratorTest < ActiveSupport::TestCase
  def setup
    @collaborator = Collaborator.new(name: "bob", email: "bob@email.com", password: "password")
  end

  test "should be valid" do
    assert @collaborator.valid?
  end

  test "name should be present" do
    @collaborator.name = ""
    assert_not @collaborator.valid?
  end

  test "email should be present" do
    @collaborator.email = ""
    assert_not @collaborator.valid?
  end
end
