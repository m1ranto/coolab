require "test_helper"

class CollaboratorTest < ActiveSupport::TestCase
  setup do
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

  test "name should not be too long" do
    @collaborator.name = "a" * 51
    assert_not @collaborator.valid?
  end

  test "email should not be too long" do
    @collaborator.email = "a" * 51  + "@email.com"
    assert_not @collaborator.valid?
  end

  test "email should be unique" do
    duplicate_collaborator = @collaborator.dup
    @collaborator.save
    assert_not duplicate_collaborator.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[collaborator@coolab.com 123abc@domain.org my-FIRST_last.name@EMAIL.com]
    valid_addresses.each do |valid_address|
      @collaborator.email = valid_address
      assert @collaborator.valid?
    end
  end

  test "email validation should reject invalid addresses" do
    valid_addresses = %w[collaborator@coolab 123abc.org name@DOMAIN+EMAIL.com.]
    valid_addresses.each do |invalid_address|
      @collaborator.email = invalid_address
      assert_not @collaborator.valid?
    end
  end
end
