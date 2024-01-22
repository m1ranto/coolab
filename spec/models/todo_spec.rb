require 'rails_helper'

RSpec.describe 'A todo' do
  fixtures :all

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