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
    find("#todo_name").fill_in with: 'My new todo'
    find("#todo_description").fill_in with: 'My new todo description'
    click_on 'Create Todo'

    expect(page).to have_content('My new todo')
  end

  it 'lists issues' do
    visit activity_path
    expect(page).to have_content('Activity')
  end

  it 'has done status' do
    visit project_path(project)
    check 'todo[done]'
    expect(current_path).to eq(project_path(project))
  end

  it 'is edited by a collaborator' do
    visit edit_project_task_todo_path(project, task, todo)
    find("#todo_name").fill_in with: 'Edited todo'
    find("#todo_description").fill_in with: 'Edited todo description'
    click_on 'Update Todo'

    expect(page).to have_content('Edited todo')
  end

  it 'is deleted by a collaborator' do
    visit project_task_todo_path(project, task, todo)
    find('.three-dots').click
    click_on 'Delete'
    expect(current_path).to eq(project_task_path(project, task))
  end
end