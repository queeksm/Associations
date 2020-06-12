class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_many :events, foreign_key: :creator_id
  has_many :attended_events
  has_many :attend, :through => :attended_events, source: :event
end
