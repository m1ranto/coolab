class Document < ApplicationRecord
  validates :name, presence: true

  belongs_to :project
  belongs_to :collaborator, optional: true
  has_many_attached :files
end