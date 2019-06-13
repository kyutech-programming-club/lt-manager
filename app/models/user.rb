class User < ApplicationRecord
  has_secure_password
  has_many :talks

  validates :name, presence: true , uniqueness: true


end
