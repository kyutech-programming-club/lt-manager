class Event < ApplicationRecord
  has_many :talks

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :start_end_check
  validates :location, presence: true

  def start_end_check
    errors.add(:end_time, "の日付を正しく記入してください。") unless
        self.start_time < self.end_time
  end


end
