class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 50 }
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :event_attendances, foreign_key: 'attendee_id', dependent: :destroy
  has_many :attended, through: :event_attendances, source: :attended_event, dependent: :destroy
end
