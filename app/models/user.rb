class User < ApplicationRecord
  has_secure_password
  has_many :talks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :user_events, dependent: :destroy
  validates :name, presence: true , uniqueness: true


end
