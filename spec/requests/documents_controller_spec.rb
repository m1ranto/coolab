require 'rails_helper'

RSpec.describe DocumentsController do
  let(:project) { projects(:coolab) }
  let(:document) { documents(:roadmap) }
  let(:collaborator) { collaborators(:miranto) }

  before do
    post login_path, params: { email: collaborator.email, password: 'miranto' }
  end

  describe 'GET #index' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get project_documents_path(project)
        expect(response).to have_http_status(:ok)
      end

      it 'returns all documents' do
        get project_documents_path(project)
        expect(response.body).to include('Documents')
      end
    end
  end

  describe 'GET #new' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get new_project_document_path(project)
        expect(response).to have_http_status(:ok)
      end

      it 'returns new document page' do
        get new_project_document_path(project)
        expect(response.body).to include('New')
      end
    end
  end

  describe 'POST #create' do
    context 'when logged in' do
      it 'redirects to document page after successfully save' do
        post project_documents_path(project), params: { document: { name: 'Roadmap', description: 'Application roadmap', project_id: project.id } }
        expect(response).to redirect_to(project_document_path(project, document))
      end
    end
  end

  describe 'GET #show' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get project_document_path(project, document)
        expect(response).to have_http_status(:ok)
      end

      it 'returns document' do
        get project_document_path(project, document)
        expect(response.body).to include(document.name)
      end
    end
  end

  describe 'GET #edit' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get edit_project_document_path(project, document)
        expect(response).to have_http_status(:ok)
      end

      it 'returns edit page' do
        get edit_project_document_path(project, document)
        expect(response.body).to include(document.name)
      end
    end
  end

  describe 'PATCH #update' do
    context 'when logged in' do
      it 'redirects to document page after successfully save' do
        patch project_document_path(project, document), params: { document: { name: 'Roadmap 2', description: 'Application roadmap 2', project_id: project.id } }
        expect(response).to redirect_to(project_document_path(project, document))
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when logged in' do
      it 'redirects to all documents after successfully delete' do
        delete project_document_path(project, document)
        expect(response).to redirect_to(project_documents_path(project))
      end
    end
  end
end