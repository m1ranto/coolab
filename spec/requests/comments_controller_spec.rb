require 'rails_helper'

RSpec.describe CommentsController do
  let(:project) { projects(:coolab) }
  let(:comment) { comments(:keep_pushing_up) }
  let(:collaborator) { collaborators(:miranto) }

  before do
    post login_path, params: { email: collaborator.email, password: 'miranto' }
  end

  describe 'GET #index' do
    context 'when logged in' do
      it 'responds with a status 200' do
        get project_comments_path(project)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #creates' do
    context 'when logged in' do
      it 'redirects to project comments page' do
        post project_comments_path(project), params: { comment: { content: 'New comment', project_id: project.id, collaborator_id: collaborator.id } }
        expect(response).to redirect_to project_comments_path(project)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when logged in with the right collaborator' do
      it 'redirects to project comments page' do
        delete project_comment_path(project, comment)
        expect(response).to redirect_to project_comments_path(project)
      end
    end
  end
end