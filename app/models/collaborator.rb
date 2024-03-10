class Collaborator < ApplicationRecord
  before_save { email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :name, presence: true,
                   length: { maximum: 50 }
  validates :email, presence: true,
                    length: { maximum: 50 },
                    uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }
  validate :valid_profile_picture

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

    def valid_profile_picture
      limit_size = 1050000
      if profile_picture.attached?
        if ActiveStorage::Attachment.joins(:blob).sum(:byte_size) > 5240000
          profile_picture.purge
          errors.add(:base, "Maximum storage volume is 5 MB")
        elsif profile_picture.blob.byte_size > limit_size && !profile_picture.blob.content_type.starts_with?('image/')
          profile_picture.purge
          errors.add(:base, "Too big file, maximum is 1 MB")
          errors.add(:base, "Must be an image")
        elsif profile_picture.blob.byte_size > limit_size
          profile_picture.purge
          errors.add(:base, "Too big file, maximum is 1 MB")
        elsif !profile_picture.blob.content_type.starts_with?('image/')
          profile_picture.purge
          errors.add(:base, "Must be an image")
        end
      end
    end
end
