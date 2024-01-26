require 'rails_helper'

RSpec.describe 'Collaborator', test: :system do
  fixtures :all

  let(:collaborator) { collaborators(:miranto) }

  it 'is created on signup' do
    visit root_path
    find("#signup").click

    fill_in 'Name', with: 'Joe'
    fill_in 'Title', with: 'CTO'
    fill_in 'Email', with: 'joe@email.com'
    fill_in 'Password', with: 'joe'
    click_on 'Create Collaborator'

    expect(current_path).to eq(collaborator_path(Collaborator.last))
  end

  context 'already created' do
    before do
      visit login_path
      fill_in 'Email', with: 'miranto@email.com'
      fill_in 'Password', with: 'miranto'
      click_on 'Sign in'
    end

    it 'has profile page' do
      visit collaborator_path(collaborator)
      expect(current_path).to eq(collaborator_path(collaborator))
    end

    context 'is edited by himself' do
      it 'via button edit on profile page' do
        visit collaborator_path(collaborator)
        click_on 'Edit'

        fill_in 'Name', with: 'Edited Joe'
        fill_in 'Title', with: 'Edited CTO'
        click_on 'Update Collaborator'

        expect(page).to have_content('Edited Joe')
      end

      it 'via link edit' do
        visit edit_collaborator_path(collaborator)

        fill_in 'Name', with: 'Edited Joe'
        fill_in 'Title', with: 'Edited CTO'
        click_on 'Update Collaborator'

        expect(page).to have_content('Edited Joe')
      end
    end

    it 'is destroyed by himself' do
      visit collaborator_path(collaborator)
      click_on 'Destroy'

      visit login_path
      expect(current_path).to eq(login_path)
    end
  end
end