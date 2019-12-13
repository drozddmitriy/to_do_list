class Comment < ApplicationRecord
  mount_uploader :file, ImageUploader
  belongs_to :task

  validates :text, presence: true
  validates_size_of :file, maximum: 10.megabytes
end
