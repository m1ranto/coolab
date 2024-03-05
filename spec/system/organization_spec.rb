require 'rails_helper'

RSpec.describe 'Organization', test: :system do
  let(:organization) { organizations(:miranto_organization) }

  before do
    visit login_path

    fill_in 'Email', with: 'miranto@email.com'
    fill_in 'Password', with: 'miranto'
    click_on 'Sign in'
  end

  it 'invites a new collaborator' do
    visit collaborators_path
    click_on 'Invite collaborators'
    expect(page).to have_content('Copy')
  end

  it 'is edited by an admin collaborator' do
    visit collaborators_path
    find('.three-dots').click
    click_on 'Edit'

    find('#organization_name').fill_in with: 'Edit Organization'
    click_on 'Update Organization'

    expect(page).to have_content('Edit Organization')
  end

  it 'is deleted by an admin collaborator' do
    visit collaborators_path
    find('.three-dots').click
    click_on 'Delete'

    expect(current_path).to eq(root_path)
  end
end