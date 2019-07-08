class Talk < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :slide_url, unless: Proc.new { |a| a.slide_url.blank?}, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :movie_url, unless: Proc.new { |a| a.movie_url.blank?}, format: /\A#{URI::regexp(%w(http https))}\z/
end
