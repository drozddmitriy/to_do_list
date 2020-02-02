class User < ApplicationRecord
  has_secure_password
  has_many :projects, dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: true, length: { minimum: 3, maximum: 50 }

  validates :password, presence: true
  validates :password, length: { is: 8 }, confirmation: true
end
