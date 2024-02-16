require 'rails_helper'

RSpec.describe 'A todo' do
  let(:collaborator) { collaborators(:miranto) }
  let(:task) { tasks(:hotwire) }
  let(:todo) { todos(:add_turbo_and_stimulus) }

  it 'has a name' do
    expect(todo).to be_valid
  end

  it 'has not a blank name' do
    todo.name = ' '
    expect(todo).not_to be_valid
  end

  it 'has not an empty name' do
    todo.name = ''
    expect(todo).not_to be_valid
  end

  it 'allows to mark as complete' do
    todo.done = true
    expect(todo).to be_done
  end

  it 'has status (done or not done)' do
    todo.done = false
    expect(todo).not_to be_done

    todo.done = true
    expect(todo).to be_done
  end

  it 'has a no priority level' do
    todo.priority = 'No priority'
    expect(todo).to be_valid
  end

  it 'has an urgent priority level' do
    todo.priority = 'Urgent'
    expect(todo).to be_valid
  end

  it 'has a high priority level' do
    todo.priority = 'High'
    expect(todo).to be_valid
  end

  it 'has a medium priority level' do
    todo.priority = 'Medium'
    expect(todo).to be_valid
  end

  it 'has a low priority level' do
    todo.priority = 'Low'
    expect(todo).to be_valid
  end

  it 'excludes undefined priority levels' do
    todo.priority = 'Other priority'
    expect(todo).not_to be_valid
  end

  it 'excludes empty priority level' do
    todo.priority = ''
    expect(todo).not_to be_valid
  end

  it 'excludes nil priority level' do
    todo.priority = nil
    expect(todo).not_to be_valid
  end

  it 'belongs to a task' do
    expect(todo.task).to eq(task)
  end

  it 'is assigned to collaborators' do
    expect { todo.collaborators << collaborator }.to change { todo.collaborators.size }.by_at_least(1)
  end

  it 'has a due date' do
    todo.due_on = Time.new.tomorrow
    expect(todo.due_on).to a_kind_of(Date)
  end
end