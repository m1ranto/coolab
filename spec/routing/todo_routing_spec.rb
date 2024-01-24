require 'rails_helper'

RSpec.describe 'todo routing' do
  it 'routes to #done' do
    expect(patch '/projects/1/tasks/1/todos/1/done').to route_to('todos#done', project_id: '1', task_id: '1', id: '1')
  end

  it 'does not route to #index' do
    expect(get '/projects/1/tasks/1/todos').not_to be_routable
  end

  it 'routes to #create' do
    expect(post '/projects/1/tasks/1/todos').to route_to('todos#create', project_id: '1', task_id: '1')
  end

  it 'routes to #new' do
    expect(get '/projects/1/tasks/1/todos/new').to route_to('todos#new', project_id: '1', task_id: '1')
  end

  it 'routes to #show' do
    expect(get '/projects/1/tasks/1/todos/1').to route_to('todos#show', project_id: '1', task_id: '1', id: '1')
  end

  it 'routes to #edit' do
    expect(get '/projects/1/tasks/1/todos/1/edit').to route_to('todos#edit', project_id: '1', task_id: '1', id: '1')
  end

  it 'routes to #update' do
    expect(patch '/projects/1/tasks/1/todos/1').to route_to('todos#update', project_id: '1', task_id: '1', id: '1')
  end

  it 'routes to #delete' do
    expect(delete '/projects/1/tasks/1/todos/1').to route_to('todos#destroy', project_id: '1', task_id: '1', id: '1')
  end
end