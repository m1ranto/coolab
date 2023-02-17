class Project < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }

  belongs_to :collaborator
  has_many   :tasks, dependent: :destroy
end
