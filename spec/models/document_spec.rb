require 'rails_helper'

RSpec.describe 'A Document' do
  let(:document) { documents(:roadmap) }
  let(:project) { projects(:coolab) }
  let(:collaborator) { collaborators(:miranto) }

  it 'has at least one attachment'
  it 'has one or many attachments'

  it 'has a name' do
    document.name = 'Roadmap'
    expect(document).to be_valid
  end

  it 'has not an empty name' do
    document.name = ''
    expect(document).not_to be_valid
  end

  it 'has not a blank name' do
    document.name = ' '
    expect(document).not_to be_valid
  end

  it 'has a description' do
    document.description = 'Application roadmap'
    expect(document).to be_valid
  end

  it 'belongs to a project' do
    document.project = project
    expect(document).to be_valid
  end

  it 'must belongs to a project' do
    document.project = nil
    expect(document).not_to be_valid
  end

  it 'is uploaded by a collaborator' do
    document.collaborator = collaborator
    expect(document).to be_valid
  end
end