require 'rails_helper'

RSpec.describe CollaboratorsHelper, test: :helper do
  let(:collaborator) { collaborators(:miranto) }

  describe 'profile picture' do
    context 'with small size' do
      it 'has class -sm' do
        expect(profile_picture_small(collaborator)).to include('sm')
      end
    end

    context 'with default (medium) size' do
      it 'has default class' do
        expect(profile_picture(collaborator)).not_to include('sm', 'lg')
      end
    end

    context 'with large size' do
      it 'has class -lg' do
        expect(profile_picture_large(collaborator)).to include('lg')
      end
    end
  end
end