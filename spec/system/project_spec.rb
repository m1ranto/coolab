require 'rails_helper'

RSpec.describe 'Project', test: :system do
  let(:project) { projects(:coolab) }

  before do
    visit login_path

    fill_in 'Email', with: 'miranto@email.com'
    fill_in 'Password', with: 'miranto'
    click_on 'Sign in'
  end

  it 'is creates by a collaborator' do
    click_on 'New project'

    fill_in 'Name', with: 'Coolab'
    fill_in 'Description', with: 'Cool collaboration app'
    click_on 'Create Project'

    visit projects_path
    expect(page).to have_content('Coolab')
  end

  it 'is edited by a collaborator' do
    visit project_path project
    click_on 'edit'

    fill_in 'Name', with: 'Edited Coolab'
    fill_in 'Description', with: 'Edited Cool collaboration app'
    click_on 'Update Project'

    expect(page).to have_content('Edited Coolab')
  end

  it 'is deleted by a collaborator' do
    visit project_path project
    click_on 'delete'
    expect(current_path).to eq(projects_path)
  end
end
