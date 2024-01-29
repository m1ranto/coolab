require 'rails_helper'

RSpec.describe LandingPagesController do
  let(:project) { projects(:coolab) }
  let(:collaborator) { collaborators(:miranto) }

  describe 'GET #index' do
    it 'responds with a status 200 (OK)' do
      get root_path
      expect(response).to have_http_status(:ok)
    end

    context 'when logged' do
      before do
        post login_path, params: { email: collaborator.email, password: 'miranto' }
      end

      it 'redirects to projects page' do
        get root_path
        expect(response).to redirect_to(projects_path)
      end
    end
  end
end