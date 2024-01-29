require 'rails_helper'

RSpec.describe CommentsHelper, test: :helper do
  let(:collaborator) { collaborators(:miranto) }
  let(:project) { projects(:coolab) }
  let(:comment) { comments(:keep_pushing_up) }

  TIME_FORMAT     =      /\d{2}:\d{2}/
  DATETIME_FORMAT = /.+ - #{TIME_FORMAT}/

  describe 'formats datetime' do
    context 'with date today' do
      it 'displays time only' do
        expect(comment_datetime(comment)).to match TIME_FORMAT
      end
    end

    context 'with date not today' do
      it 'displays date and time' do
        comment.created_at = Date.yesterday
        expect(comment_datetime(comment)).to match DATETIME_FORMAT
      end
    end
  end
end