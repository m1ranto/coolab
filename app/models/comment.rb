class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :project
  belongs_to :collaborator

  after_create_commit -> { broadcast_append_to "comment" }
  after_destroy_commit -> { broadcast_remove_to "comment" }
end
