require 'rails_helper'

RSpec.describe CollaboratorsController do
  let(:project) { projects(:coolab) }
  let(:task) { tasks(:hotwire) }
  let(:todo) { todos(:add_turbo_and_stimulus) }
  let(:collaborator) { collaborators(:miranto) }

  before do
    post login_path, params: { email: collaborator.email, password: 'miranto' }
  end

  describe 'GET #index' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get collaborators_path
        expect(response).to have_http_status(:ok)
      end

      it 'returns all collaborators' do
        get collaborators_path
        expect(response.body).to include(collaborator.name)
      end
    end
  end

  describe 'GET #new' do
    context 'when logged in' do
      it 'redirects to collaborators page' do
        get signup_path
        expect(response).to redirect_to collaborators_path
      end
    end
  end

  describe 'GET #show' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get collaborator_path(collaborator)
        expect(response).to have_http_status(:ok)
      end

      it 'returns a collaborator' do
        get collaborator_path(collaborator)
        expect(response.body).to include(collaborator.name)
      end
    end
  end

  describe 'GET #edit' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get edit_collaborator_path(collaborator)
        expect(response).to have_http_status(:ok)
      end

      it 'returns a collaborator' do
        get edit_collaborator_path(collaborator)
        expect(response.body).to include(collaborator.name)
      end
    end
  end

  describe 'POST #create' do
    context 'when not logged in' do
      it 'redirects to projects home page after successfully save' do
        post collaborators_path, params: { collaborator: { name: 'Name', email: 'name@email.com', password: 'name' } }
        expect(response).to redirect_to collaborator_path(Collaborator.last)
      end
    end
  end

  describe 'PATCH #update' do
    context 'when logged in' do
      it 'redirects to collaborator page after successfully update' do
        patch collaborator_path(collaborator), params: { collaborator: { name: 'Name update' } }
        expect(response).to redirect_to collaborator_path(collaborator)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when logged in' do
      it 'redirects to collaborator page after successfully delete' do
        delete collaborator_path(collaborator)
        expect(response).to redirect_to collaborators_path
      end
    end
  end
end