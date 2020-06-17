class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_many :events, foreign_key: :creator_id
  has_many :attended_events, dependent: :destroy
  has_many :attend, through: :attended_events, source: :event

  def already_attend?(event)
    event.atendees.include?(self)
  end
end
