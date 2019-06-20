class Review < ApplicationRecord
  belongs_to :user
  belongs_to :talk

  validates :comment, presence: true
end
