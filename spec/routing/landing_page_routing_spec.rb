require 'rails_helper'

RSpec.describe 'landing page routing' do
  it 'routes to #index' do
    expect(get '/').to route_to('landing_pages#index')
  end
end