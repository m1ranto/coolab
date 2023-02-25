class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :project
  belongs_to :collaborator
end
