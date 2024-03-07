class Todo < ApplicationRecord
  PRIORITY_LEVELS = ["No priority", "Urgent", "High", "Medium", "Low"]

  validates :name, presence: true
  validates :priority, inclusion: { in: PRIORITY_LEVELS }

  belongs_to :task
  has_and_belongs_to_many :collaborators

  scope :completed, -> { where(done: true) }
  scope :uncompleted, -> { where(done: false) }
end
