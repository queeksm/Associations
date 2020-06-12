class AttendedEvent < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :event, class_name: 'Event'
end
