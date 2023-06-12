class Organization < ApplicationRecord
  has_many :collaborators, dependent: :destroy
end
