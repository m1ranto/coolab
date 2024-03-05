require 'rails_helper'

RSpec.describe OrganizationsController do
  let(:organization) { organizations(:miranto_organization) }
  let(:admin) { collaborators(:miranto) }
  let(:collaborator) { collaborators(:james) }

  describe 'GET #invite' do
    context 'when logged in' do
      context 'when collaborator is an admin' do
        before do
          post login_path, params: { email: admin.email, password: 'miranto' }
          get organization_invite_path(organization)
        end

        it 'returns invite page' do
          expect(response.body).to include(organization.name)
        end

        it 'responds with a status 200 (OK)' do
          expect(response).to have_http_status(:ok)
        end
      end

      context 'when collaborator is not an admin' do
        it 'redirects to collaborators page' do
          post login_path, params: { email: collaborator.email, password: 'james' }
          get organization_invite_path(organization)
          expect(response).to redirect_to(collaborators_path)
        end
      end
    end

    context 'when logged out' do
      it 'redirects to login page' do
        delete logout_path
        get organization_invite_path(organization)
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'GET #join' do
    context 'when logged in' do
      it 'redirects to projects index page' do
        post login_path, params: { email: admin.email, password: 'miranto' }
        get organization_join_path(organization, '3T56X51wHINj-sGxkrF4FA')
        expect(response).to redirect_to(projects_path)
      end
    end

    context 'when logged out' do
      context 'when invitation token is valid' do
        before do
          delete logout_path
          get organization_join_path(organization, '3T56X51wHINj-sGxkrF4FA')
        end

        it 'returns join page' do
          expect(response.body).to include(organization.name)
        end

        it 'responds with a status 200 (OK)' do
          expect(response).to have_http_status(:ok)
        end
      end

      context 'when invitation token is not valid' do
        it 'redirects to landing page' do
          delete logout_path
          get organization_join_path(organization, '3T56X51wHINj-sGinvalid')
          expect(response).to redirect_to(root_path)
        end
      end
    end
  end

  describe 'GET #edit' do
    context 'when logged in' do
      context 'when collaborator is an admin' do
        before do
          post login_path, params: { email: admin.email, password: 'miranto' }
          get edit_organization_path(organization)
        end

        it 'returns edit organization page' do
          expect(response.body).to include(organization.name)
        end

        it 'responds with a status 200 (OK)' do
          expect(response).to have_http_status(:ok)
        end
      end

      context 'when collaborator is not an admin' do
        it 'redirects to collaborators page' do
          post login_path, params: { email: collaborator.email, password: 'james' }
          get edit_organization_path(organization)
          expect(response).to redirect_to(collaborators_path)
        end
      end
    end

    context 'when logged out' do
      it 'redirects to login page' do
        delete logout_path
        get edit_organization_path(organization)
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'PATCH #update' do
    context 'when logged in' do
      context 'when collaborator is an admin' do
        it 'redirects to collaborators index page after successfully update' do
          post login_path, params: { email: admin.email, password: 'miranto' }
          patch organization_path(organization), params: { organization: { name: 'Edit Organization' } }
          expect(response).to redirect_to(collaborators_path)
        end
      end
    end

    context 'when logged out' do
      it 'redirects to login page' do
        delete logout_path
        patch organization_path(organization), params: { organization: { name: 'Edit Organization' } }
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when logged in' do
      context 'when collaborator is an admin' do
        it 'redirects to landing page after successfully delete' do
          post login_path, params: { email: admin.email, password: 'miranto' }
          delete organization_path(organization)
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context 'when logged out' do
      it 'redirects to login page' do
        delete logout_path
        delete organization_path(organization)
        expect(response).to redirect_to(login_path)
      end
    end
  end
end