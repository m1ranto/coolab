require 'rails_helper'

RSpec.describe "A comment" do
  let(:collaborator) { collaborators(:miranto) }
  let(:project) { projects(:coolab) }
  let(:comment) { comments(:keep_pushing_up) }

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