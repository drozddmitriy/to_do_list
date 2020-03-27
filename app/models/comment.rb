class Comment < ApplicationRecord
  mount_uploader :file, ImageUploader
  belongs_to :task

  validates :text, presence: true
  validates_integrity_of :file
  validates_processing_of :file
end
