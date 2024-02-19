require 'rails_helper'

RSpec.describe "document routing" do
  it 'routes to #new' do
    expect(get 'projects/1/documents/new').to route_to('documents#new', project_id: '1')
  end

  it 'routes to #create' do
    expect(post '/projects/1/documents').to route_to('documents#create', project_id: '1')
  end

  it 'routes to #index' do
    expect(get '/projects/1/documents').to route_to('documentes#index', project_id: '1')
  end

  it 'routes to #show' do
    expect(get '/projects/1/documents/1').to route_to('documents#show', project_id: '1', id: '1')
  end

  it 'routes to #edit' do
    expect(get '/projects/1/documents/1/edit').to route_to('documents#edit', project_id: '1', id: '1')
  end

  it 'routes to #update' do
    expect(patch '/projects/1/documents/1').to route_to('documents#update', project_id: '1', id: '1')
  end

  it 'routes to #destroy' do
    expect(delete '/projects/1/documents/1').to route_to('documents#destroy', project_id: '1', id: '1')
  end
end