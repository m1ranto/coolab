require 'rails_helper'

RSpec.describe 'Comment', test: :system do
  let(:project) { projects(:coolab) }

  before do
    visit login_path
    fill_in 'Email', with: 'miranto@email.com'
    fill_in 'Password', with: 'miranto'
    click_on 'Sign in'
  end

  it 'is created by a collaborator' do
    visit project_path(project)
    click_on 'Campfire'
    fill_in 'comment[content]', with: "New comment"
    click_on 'Send'

    expect(page).to have_content('New comment')
  end

  it 'is destroyed by a collaborator' do
    visit project_path(project)
    click_on 'Campfire'
    find('.bi-trash').click

    expect(current_path).to eq(project_comments_path(project))
  end
end