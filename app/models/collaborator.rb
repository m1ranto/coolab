class Collaborator < ApplicationRecord
  before_save { email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :name, presence: true,
                   length: { maximum: 50 }
  validates :email, presence: true,
                    length: { maximum: 50 },
                    uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }

  has_many :projects, dependent: :destroy
  has_and_belongs_to_many :todos
  has_many :comments, dependent: :destroy

  has_secure_password

  # Generate password digest for tests
  def Collaborator.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
