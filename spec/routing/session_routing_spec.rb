require 'rails_helper'

RSpec.describe 'session routing' do
  it 'routes to #new' do
    expect(get '/login').to route_to('sessions#new')
  end

  it 'routes to #create' do
    expect(post '/login').to route_to('sessions#create')
  end

  it 'routes to #destroy' do
    expect(delete '/logout').to route_to('sessions#destroy')
  end
end