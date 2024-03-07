class Task < ApplicationRecord
  validates :name, presence: true

  belongs_to :project
  has_many   :todos, dependent: :destroy

  default_scope { order(created_at: :desc) }
  scope :recent, -> { order(created_at: :desc).limit(10) }
end
