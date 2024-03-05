require 'rails_helper'

RSpec.describe 'organization routing' do
  it 'routes to #invite' do
    expect(get '/organizations/1/invite').to route_to('organizations#invite', id: '1')
  end

  it 'routes to #join' do
    expect(get '/organizations/1/join/3T56X51wHINj-sGxkrF4FA').to route_to('organizations#join', id: '1', invitation_id: '3T56X51wHINj-sGxkrF4FA')
  end

  it 'routes to #edit' do
    expect(get '/organizations/1/edit').to route_to('organizations#edit', id: '1')
  end

  it 'routes to update' do
    expect(patch '/organizations/1').to route_to('organizations#update', id: '1')
  end

  it 'routes to destroy' do
    expect(delete '/organizations/1').to route_to('organizations#destroy', id: '1')
  end
end