class Document < ApplicationRecord
  validates :name, presence: true
  validate  :acceptable_files

  belongs_to :project
  belongs_to :collaborator, optional: true
  has_many_attached :files

  default_scope { order(created_at: :desc) }
  scope :recent, -> { order(created_at: :desc).limit(6) }

  private

    def acceptable_files
      return unless files.attached?

      unless ActiveStorage::Attachment.joins(:blob).sum(:byte_size) < 100.megabytes
        errors.add(:base, "Maximum storage volume is 100 MB")
      end

      files_size = files.map { |file| file.blob.byte_size }.sum
      unless files_size < 1.megabyte
        errors.add(:base, "Too big file, maximum is 1 MB")
      end
    end
end