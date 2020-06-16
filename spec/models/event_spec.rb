require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'context' do
    before {user = User.create(username: 'tester_user')}

    it 'is not valid' do
      event = Event.create(name: '', location: '',date: '')
      expect(event.errors.has_key?(:name)).to be true      
      expect(event.errors.has_key?(:location)).to be true
      expect(event.errors.has_key?(:date)).to be true
    end

    it 'is unique' do      
      event = Event.create(name: 'Event1', location: 'here', date: '2020-06-30', creator_id: '1')
      anotherEvent = Event.create(name: 'Event1', location: 'there', date: '2020-06-30', creator_id: '1')
      expect(anotherEvent.errors[:name]).to include('has already been taken')
    end

    it 'is within upcoming or past events' do
      event = Event.create(name: 'Event1', location: 'here', date: '2030-06-30', creator_id: '1')
      prev_events = Event.previous
      prev_events.each do |events|
        expect(events.name).to be nil
      end
    end

    it 'is within upcoming or past events' do
      event = Event.create(name: 'Event1', location: 'here', date: '2010-06-30', creator_id: '1')
      prev_events = Event.upcoming
      prev_events.each do |events|
        expect(events.name).to be nil
      end
    end
  end
end