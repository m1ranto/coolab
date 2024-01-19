require 'rails_helper'

RSpec.describe 'An organization' do
  let(:organization) { Organization.new(name: 'Organization') }
  let(:collaborator) { Collaborator.new(name: 'Bob', email: 'bob@email.com', password: 'bob', organization: organization) }
  let(:project) { Project.new(name: 'Coolab', collaborator: collaborator) }
  let(:task) { Task.new(name: 'Task', project: project) }
  let(:todo) { Todo.new(name: 'Todo', task: task) }
  let(:comment) { Comment.new(content: 'Comment', project: project, collaborator: collaborator) }

  it 'has an name' do
    expect(organization).to be_valid
  end

  it 'has not a blank name' do
    organization.name = ' '
    expect(organization).not_to be_valid
  end

  it 'has not an empty name' do
    organization.name = ''
    expect(organization).not_to be_valid
  end

  it 'has collaborators' do
    expect { organization.collaborators << collaborator }.to change { organization.collaborators.size }.by(1)
  end
end