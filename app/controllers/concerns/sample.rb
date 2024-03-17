module Sample
  attr_accessor :organization, :miranto, :iliana, :sample_project, :empty_project, :app_roadmap, :strategies_product

  def self.all(organization)
    @organization = organization
    Sample.collaborators
    Sample.projects
    Sample.tasks
    Sample.todos
    Sample.comments
    Sample.documents
  end

  private

    def self.collaborators
      @miranto  = Collaborator.create( name: 'Miranto', email: "miranto#{@organization.id}@email.com", title: 'Ruby on Rails Developer', password: 'miranto', organization: @organization, profile: 'darkslategrey' )
      @miranto.profile_picture.attach(io: File.open('app/assets/images/collaborator1.png'), filename: "collaborator1.png", content_type: "image/png")

      @iliana   = Collaborator.create( name: 'Iliana', email: "iliana#{@organization.id}@email.com", title: 'Customer Success', password: 'iliana', organization: @organization, profile: 'sienna' )
      @iliana.profile_picture.attach(io: File.open('app/assets/images/collaborator2.png'), filename: "collaborator2.png", content_type: "image/png")
    end

    def self.projects
      @sample_project = Project.create( name: 'Sample project', description: 'Build cool web app', collaborator: @miranto )
      @empty_project  = Project.create( name: 'Empty project', description: 'Plan marketing' , collaborator: @iliana )
    end

    def self.tasks
      @app_roadmap        = Task.create( name: 'App roadmap', project: @sample_project )
      @strategies_product = Task.create( name: 'Strategies for product', project: @sample_project )
    end

    def self.todos
      Todo.create!([
        { name: 'Add new feature', description: 'Planning and crafting new feature for the app', task: @app_roadmap, collaborators: [@miranto, @iliana], due_on: 2.weeks.from_now, priority: "High", done: false },
        { name: 'Refactor code', task: @app_roadmap, collaborators: [@miranto], due_on: 2.weeks.from_now, priority: "No priority", done: false },
        { name: 'A/B testing product', description: 'A/B test the app for marketing and strategies purposes', task: @strategies_product, priority: "No priority", done: false },
        { name: 'Improve design', description: 'Improve design to make it more user-friendly', task: @strategies_product, collaborators: [@miranto], due_on: 1.month.from_now, priority: "Urgent", done: false },
        { name: 'Create email marketing campaign', task: @strategies_product, collaborators: [@iliana], priority: "High", done: false },
      ])
    end

    def self.comments
      Comment.create!([
        { content: 'Hi Team !!', project_id: @sample_project.id, collaborator_id: @miranto.id },
        { content: "Hi, how about the new feature?", project_id: @sample_project.id, collaborator_id: @iliana.id },
        { content: "Should we improve the design?", project_id: @sample_project.id, collaborator_id: @iliana.id },
        { content: "Yes, let's build great thing, together!", project_id: @sample_project.id, collaborator_id: @miranto.id },
      ])
    end

    def self.documents
      doc1 = Document.create(name: 'doc1', project_id: @sample_project.id, collaborator_id: @miranto.id)
      doc1.files.attach(io: File.open('app/assets/images/collaborations1.jpg'), filename: "collaborators1.jpg", content_type: "image/jpeg")

      doc2 = Document.create(name: 'doc2', project_id: @sample_project.id, collaborator_id: @iliana.id)
      doc2.files.attach(io: File.open('app/assets/images/collaborations2.jpg'), filename: "collaborators2.jpg", content_type: "image/jpeg")
    end
end