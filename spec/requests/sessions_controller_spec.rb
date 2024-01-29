require 'rails_helper'

RSpec.describe SessionsController do
  let(:collaborator) { collaborators(:miranto) }

  describe 'GET #new' do
    it 'responds with a status 200 (OK)' do
      get login_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    it 'creates a session' do
      post login_path, params: { email: collaborator.email, password: 'miranto' }
      expect(session[:collaborator_id]).not_to be_nil
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a session' do
      delete logout_path
      expect(session[:collaborator_id]).to be_nil
    end
  end
end