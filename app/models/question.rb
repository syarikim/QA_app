class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: { maximum: 30 }
  validates :detail, presence: true
end
