require 'rails_helper'

RSpec.describe 'Todo', test: :system do
  let(:project) { projects(:coolab) }
  let(:task) { tasks(:hotwire) }
  let(:todo) { todos(:add_turbo_and_stimulus) }

  before do
    visit login_path
    fill_in 'Email', with: 'miranto@email.com'
    fill_in 'Password', with: 'miranto'
    click_on 'Sign in'
  end

  it 'is created by a collaborator' do
    visit new_project_task_todo_path(project, task)
    fill_in 'Name', with: 'My new todo'
    fill_in 'Description', with: 'My new todo description'
    select('Miranto', from: 'Collaborator')
    click_on 'Create Todo'

    expect(page).to have_content('My new todo')
  end

  it 'has done status' do
    visit project_path(project)
    check 'todo[done]'
    expect(current_path).to eq(project_path(project))
  end

  it 'is edited by a collaborator' do
    visit edit_project_task_todo_path(project, task, todo)
    fill_in 'Name', with: 'Edited todo'
    fill_in 'Description', with: 'Edited todo description'
    select('James', from: 'Collaborator')
    click_on 'Update Todo'

    expect(page).to have_content('Edited todo')
  end

  it 'is deleted by a collaborator' do
    visit project_task_todo_path(project, task, todo)
    click_on 'delete'
    expect(current_path).to eq(project_task_path(project, task))
  end
end