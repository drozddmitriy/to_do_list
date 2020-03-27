class User < ApplicationRecord
  has_secure_password
  has_many :projects, dependent: :destroy

  validates :username, presence: true,
                       uniqueness: true, length: { minimum: 3, maximum: 50 }

  validates :password, presence: true,
                       length: { is: 8 }, confirmation: true
end
