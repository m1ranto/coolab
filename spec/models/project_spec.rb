require 'rails_helper'

RSpec.describe 'A project' do
  let(:collaborator) { Collaborator.new(name: 'Bob', email: 'bob@email.com') }
  let(:project) { Project.new(name: 'Coolab', collaborator: collaborator) }
  let(:task) { Task.new(name: 'Task') }
  let(:comment) { Comment.new(content: 'Comment') }

  it 'has a name' do
    project.name = 'Coolab'
    expect(project).to be_valid
  end

  it 'has not a blank name' do
    project.name = ' '
    expect(project).not_to be_valid
  end

  it 'has not an empty name' do
    project.name = ''
    expect(project).not_to be_valid
  end

  it 'lists tasks' do
    expect { project.tasks << task }.to change { project.tasks.size }.by(1)
  end

  it 'has collaborators' do
    expect(project.collaborator).not_to be_nil
  end

  it 'can be commented' do
    expect { project.comments << comment }.to change { project.comments.size }.by(1)
  end
end