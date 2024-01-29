require 'rails_helper'

RSpec.describe 'An organization' do
  let(:organization) { organizations(:miranto_organization) }
  let(:collaborator) { collaborators(:james) }

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