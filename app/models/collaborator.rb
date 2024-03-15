class Collaborator < ApplicationRecord
  before_save { email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :name, presence: true,
                   length: { maximum: 50 }
  validates :email, presence: true,
                    length: { maximum: 50 },
                    uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }
  validate :acceptable_profile_picture

  has_many :projects, dependent: :destroy
  has_and_belongs_to_many :todos
  has_many :comments, dependent: :destroy
  belongs_to :organization
  has_many :documents, dependent: :destroy
  has_one_attached :profile_picture

  has_secure_password

  # Generate password digest for tests
  def Collaborator.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private

    def acceptable_profile_picture
      return unless profile_picture.attached?

      unless ActiveStorage::Attachment.joins(:blob).sum(:byte_size) < 100.megabytes
        errors.add(:base, "Maximum storage volume is 100 MB")
      end

      unless profile_picture.blob.byte_size < 1.megabyte
        errors.add(:base, "Too big file, maximum is 1 MB")
      end

      unless profile_picture.content_type.starts_with?('image/')
        errors.add(:base, "Must be an image")
      end
    end
end
