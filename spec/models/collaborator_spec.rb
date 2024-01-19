require 'rails_helper'

RSpec.describe 'A collaborator' do
  let(:organization) { Organization.new(name: 'Organization') }
  let(:collaborator) { Collaborator.new(name: 'Bob', email: 'bob@email.com', password: 'bob', organization: organization) }
  let(:project) { Project.new(name: 'Coolab', collaborator: collaborator) }
  let(:task) { Task.new(name: 'Task', project: project) }
  let(:todo) { Todo.new(name: 'Todo', task: task) }
  let(:comment) { Comment.new(content: 'Comment', project: project, collaborator: collaborator) }

  it 'has a name' do
    expect(collaborator).to be_valid
  end

  it 'has not a blank name' do
    collaborator.name = ' '
    expect(collaborator).not_to be_valid
  end

  it 'has not an empty name' do
    collaborator.name = ''
    expect(collaborator).not_to be_valid
  end

  it 'has a valid email' do
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
    expect(collaborator.email).to match VALID_EMAIL_REGEX
  end

  it 'has an associated password' do
    expect(collaborator.password).not_to be_empty
  end

  it 'belongs to an organization' do
    expect(collaborator.organization).to eq(organization)
  end

  it 'can create a project' do
    expect { collaborator.projects.new(name: 'Project') }.to change { collaborator.projects.size }.by(1)
  end

  it 'can assign a todo' do
    expect { collaborator.todos.new(name: 'Todo') }.to change { collaborator.todos.size }.by_at_least(1)
  end

  it 'can comment on a project' do
    expect { collaborator.comments.new(content: 'Comment') }.to change {  collaborator.comments.size }.by(1)
  end
end