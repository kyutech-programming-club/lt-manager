class User < ApplicationRecord
  has_secure_password
  has_many :talks
  has_many :user_events
  has_many :events, through: :user_events
  validates :name, presence: true , uniqueness: true


end
