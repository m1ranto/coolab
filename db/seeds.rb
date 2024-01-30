# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Organization
miranto_organization = Organization.create! name: 'Miranto-Organization'

# Collaborators
miranto   = Collaborator.create( name: 'Miranto', email: 'miranto@email.com', title: 'Web Developer', password: 'miranto', organization: miranto_organization, profile: 'darkslategrey' )
iliana    = Collaborator.create( name: 'Iliana', email: 'iliana@email.com', title: 'Customer Success', password: 'iliana', organization: miranto_organization, profile: 'sienna' )
madeleine = Collaborator.create( name: 'Madeleine', email: 'madeleine@email.com', title: 'Product Owner', password: 'madeleine', organization: miranto_organization, profile: 'brown' )
lynda     = Collaborator.create( name: 'Lynda', email: 'lynda@email.com', title: 'Business Developer', password: 'lynda', organization: miranto_organization, profile: 'darkslateblue' )
ive       = Collaborator.create( name: 'Ive', email: 'steven@email.com', title: 'Designer', password: 'jorge', organization: miranto_organization, profile: 'darkolivegreen' )

# Projects
web_app   = Project.create( name: 'Web app', description: 'Build cool web app', collaborator: miranto )
marketing = Project.create( name: 'Marketing', description: 'Plan marketing' , collaborator: lynda )

# Tasks
hotwire     = Task.create( name: 'Hotwire', project: web_app )
improve_app = Task.create( name: 'Improve app', project: web_app )
strategies  = Task.create( name: 'Strategies for marketing', project: marketing )

# Todos
Todo.create!([
  { name: 'Add turbo', description: 'Add turbo drive, frame and stream to make app more dynamic', task: hotwire, collaborators: [miranto], due_on: 2.week.ago, done: true },
  { name: 'Add stimulus', description: 'Add stimulus.js for javascript need', task: hotwire, collaborators: [miranto], due_on: 2.week.ago, done: true },
  { name: 'Test with rspec', description: 'Add test unit and end-to-end test with rspec', task: improve_app, collaborators: [miranto], due_on: 1.week.ago, done: true },
  { name: 'Improve design', description: 'Improve design to make it more user-friendly', task: improve_app, collaborators: [iliana, madeleine, ive], due_on: 1.month.from_now, done: false },
  { name: 'A/B testing app', description: 'A/B test the app for marketing and strategies purposes', task: strategies, collaborators: [miranto, iliana, madeleine, lynda, ive], done: false },
])

# Comments
Comment.create!([
  { content: 'Keep pushing up!!', project_id: web_app.id, collaborator_id: iliana.id },
  { content: "Let's go! Together!", project_id: web_app.id, collaborator_id: lynda.id },
  { content: 'Yes, Yes :)', project_id: web_app.id, collaborator_id: miranto.id },
  { content: "Let's build great thing, together!", project_id: web_app.id, collaborator_id: ive.id },
])