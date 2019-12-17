class Comment < ApplicationRecord
  mount_uploader :file, ImageUploader
  belongs_to :task

  validates :text, presence: true
  validates :file, length: { maximum: 10.megabytes }
end
