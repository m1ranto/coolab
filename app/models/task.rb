class Task < ApplicationRecord
  validates :name, presence: true

  belongs_to :project
  has_many   :todos, dependent: :destroy

  scope :recent, -> { order(created_at: :desc).limit(5) }
end
