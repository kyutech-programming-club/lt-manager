class Event < ApplicationRecord
  has_many :talks, dependent: :destroy
  has_many :user_events, dependent: :destroy
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :start_end_check
  validates :location, presence: true

  def start_end_check
    return if start_time.nil? || end_time.nil?
    errors.add(:end_time, "の日付を正しく記入してください。") unless
        self.start_time < self.end_time
  end


end
