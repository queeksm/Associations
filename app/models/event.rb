class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attended_events, dependent: :destroy
  has_many :atendees, through: :attended_events, source: :user

  scope :previous, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }  
end
