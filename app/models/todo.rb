class Todo < ApplicationRecord
  validates :name, presence: true

  belongs_to :task
  has_and_belongs_to_many :collaborators

  scope :undone, -> { where(done: false) }
end
