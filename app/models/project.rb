class Project < ApplicationRecord
  belongs_to :user
  has_many(:tasks,
           -> { order(position: :asc) },
           inverse_of: :project,
           dependent: :destroy)

  validates :name, presence: true
end
