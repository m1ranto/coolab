class Collaborator < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 50 }, uniqueness: true

  has_secure_password
end
