require 'rails_helper'

RSpec.describe "collaborator routing" do
  it 'routes to #new' do
    expect(get '/signup').to route_to('collaborators#new')
  end

  it 'routes to #invite' do
    expect(post '/invite').to route_to('collaborators#invite')
  end

  it 'routes to #create' do
    expect(post '/collaborators').to route_to('collaborators#create')
  end

  it 'routes to #index' do
    expect(get '/collaborators').to route_to('collaborators#index')
  end

  it 'routes to #show' do
    expect(get '/collaborators/1').to route_to('collaborators#show', id: '1')
  end

  it 'routes to #edit' do
    expect(get '/collaborators/1/edit').to route_to('collaborators#edit', id: '1')
  end

  it 'routes to #update' do
    expect(patch '/collaborators/1').to route_to('collaborators#update', id: '1')
  end

  it 'routes to #destroy' do
    expect(delete '/collaborators/1').to route_to('collaborators#destroy', id: '1')
  end
end