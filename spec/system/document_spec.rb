require 'rails_helper'

RSpec.describe 'Document', test: :system do
  let(:project) { projects(:coolab) }
  let(:document) { documents(:roadmap) }

  before do
    visit login_path

    fill_in 'Email', with: 'miranto@email.com'
    fill_in 'Password', with: 'miranto'
    click_on 'Sign in'
  end

  it 'is edited by a collaborator' do
    visit edit_project_document_path(project, document)
    fill_in 'Name this document', with: 'Roadmap update'
    fill_in 'Add description', with: 'App roadmap update'
    click_on 'Update Document'

    expect(page).to have_content('Roadmap update')
  end

  it 'is deleted by a collaborator' do
    visit project_document_path(project, document)
    find('.three-dots').click
    click_on 'Delete'

    expect(current_path).to eq(project_documents_path(project))
  end
end