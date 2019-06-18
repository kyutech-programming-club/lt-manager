class Talk < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :reviews

  validates :title, presence: true
end
