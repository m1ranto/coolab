class Todo < ApplicationRecord
  PRIORITIES = ["No priority", "Urgent", "Medium", "Low"]

  validates :name, presence: true
  validates :priority, inclusion: { in: PRIORITIES }

  belongs_to :task
  has_and_belongs_to_many :collaborators

  scope :undone, -> { where(done: false) }
end
