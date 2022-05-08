class User < ApplicationRecord
  has_secure_password
  has_many :questions
  has_many :answers
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
