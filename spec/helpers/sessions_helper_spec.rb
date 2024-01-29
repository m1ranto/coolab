require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:collaborator) { collaborators(:miranto) }

  before do
    log_in(collaborator)
  end

  context 'when logged in' do
    it 'creates a session' do
      expect(session[:collaborator_id]).not_to be_nil
    end

    it 'has a current logged in collaborator' do
      expect(current_collaborator).to a_kind_of(Collaborator)
    end
  end

  context 'when logged out' do
    before do
      log_out
    end

    it 'deletes a session' do
      expect(session[:collaborator_id]).to be_nil
    end

    it 'has not a current logged in collaborator' do
      expect(current_collaborator).to be_nil
    end
  end
end