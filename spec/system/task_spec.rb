require 'rails_helper'

RSpec.describe 'Task', test: :system do
  before do
    visit login_path
    fill_in 'Email', with: 'miranto@email.com'
    fill_in 'Password', with: 'miranto'
    click_on 'Sign in'
  end

  it 'is created by a collaborator' do
    visit project_path(Project.first)
    click_on 'New task'
    fill_in 'Name', with: 'My new task'
    click_on 'Create Task'
    expect(page).to have_content('My new task')
  end

  it 'is edited by a collaborator' do
    visit project_path(Project.first)
    click_on 'Edit'
    fill_in 'Name', with: 'Edited My new task'
    click_on 'Update Task'
    expect(page).to have_content('Edited My new task')
  end

  it 'is deleted by a collaborator' do
    visit project_path(Project.first)
    click_on 'Delete'
    expect(current_path).to eq(project_path(Project.first))
  end
end