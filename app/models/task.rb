class Task < ApplicationRecord
  validates :name, presence: true

  belongs_to :project
  has_many   :todos, dependent: :destroy
end
