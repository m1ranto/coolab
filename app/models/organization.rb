class Organization < ApplicationRecord
  validates :name, presence: true

  has_many :collaborators, dependent: :destroy
end
