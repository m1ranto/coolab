class Project < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }

  belongs_to :collaborator
  has_many   :tasks, dependent: :destroy
  has_many   :comments, dependent: :destroy
  has_many   :documents, dependent: :destroy

  default_scope { order(created_at: :asc) }
end
