class Task < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy

  acts_as_list scope: :project

  validates :name, presence: true
  validate :position_count, on: :update

  def position_count
    errors.add(:position, :position_error) if position > project.tasks.count
  end
end
