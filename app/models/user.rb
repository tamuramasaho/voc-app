class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :words, dependent: :destroy
end
