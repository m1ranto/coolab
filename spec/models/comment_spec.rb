require 'rails_helper'

RSpec.describe "A comment" do
  let(:collaborator) { Collaborator.new(name: 'Bob', email: 'bob@email.com') }
  let(:project) { Project.new(name: 'Coolab', collaborator: collaborator) }
  let(:task) { Task.new(name: 'Task', project: project) }
  let(:todo) { Todo.new(name: 'Todo', task: task) }
  let(:comment) { Comment.new(content: 'Comment', project: project, collaborator: collaborator) }

  it 'has content' do
    expect(comment).to be_valid
  end

  it 'has not a blank content' do
    comment.content = ' '
    expect(comment).not_to be_valid
  end

  it 'has not an empty content' do
    comment.content = ''
    expect(comment).not_to be_valid
  end

  it 'is attached to a project' do
    expect(comment.project).to eq(project)
  end

  it 'belongs to a collaborator' do
    expect(comment.collaborator).to eq(collaborator)
  end
end