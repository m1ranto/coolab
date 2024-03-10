class Document < ApplicationRecord
  validates :name, presence: true
  validate  :files_size

  belongs_to :project
  belongs_to :collaborator, optional: true
  has_many_attached :files

  private

    def files_size
      if files.attached?
        if ActiveStorage::Attachment.joins(:blob).sum(:byte_size) > 5240000
          files.purge
          errors.add(:base, "Maximum storage volume is 5 MB")
        else
          files.each do |file|
            if file.blob.byte_size > 1050000
              file.purge
              errors.add(:base, "Too big file, maximum is 1 MB")
            end
          end
        end
      end
    end
end