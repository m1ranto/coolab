require 'rails_helper'

RSpec.describe "A task" do
  let(:collaborator) { Collaborator.new(name: 'Bob', email: 'bob@email.com') }
  let(:project) { Project.new(name: 'Coolab', collaborator: collaborator) }
  let(:task) { Task.new(name: 'Task', project: project) }
  let(:todo) { Todo.new(name: 'Todo') }

  it 'has a name' do
    expect(task).to be_valid
  end

  it 'has not a blank name' do
    task.name = ' '
    expect(task).not_to be_valid
  end

  it 'has not an empty name' do
    task.name = ''
    expect(task).not_to be_valid
  end

  it 'lists todos' do
    expect { task.todos << todo }.to change { task.todos.size }.by(1)
  end

  it 'belongs to a project' do
    expect(task.project).to eq(project)
  end
end