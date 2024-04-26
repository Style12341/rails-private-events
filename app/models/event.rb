class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendances, foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, through: :event_attendances, source: :attendee

  scope :past, -> { where('date < ?', Time.now).order('date DESC') }
  scope :upcoming, -> { where('date >= ?', Time.now).order('date ASC') }

  validates :name, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :creator_id, presence: true
end
