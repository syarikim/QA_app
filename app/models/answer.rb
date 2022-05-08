class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :detail, presence: true
end
