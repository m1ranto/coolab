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

    find('#project_name').fill_in with: 'Coolab'
    find('#project_description').fill_in with: 'Cool collaboration app'
    click_on 'Create Project'

    visit projects_path
    expect(page).to have_content('Coolab')
  end

  it 'is edited by a collaborator' do
    visit project_path project
    find('.three-dots').click
    click_on 'Edit'

    find('#project_name').fill_in with: 'Edited Coolab'
    find('#project_description').fill_in with: 'Edited Cool collaboration app'
    click_on 'Update Project'

    expect(page).to have_content('Edited Coolab')
  end

  it 'is deleted by a collaborator' do
    visit project_path project
    find('.three-dots').click
    click_on 'Delete'
    expect(current_path).to eq(projects_path)
  end
end
