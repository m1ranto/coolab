require 'rails_helper'

RSpec.describe 'comment routing' do
  it 'routes to #index' do
    expect(get '/projects/1/comments').to route_to('comments#index', project_id: '1')
  end

  it 'routes to #create' do
    expect(post '/projects/1/comments').to route_to('comments#create', project_id: '1')
  end

  it 'routes to #destroy' do
    expect(delete '/projects/1/comments/1').to route_to('comments#destroy', project_id: '1', id: '1')
  end
end