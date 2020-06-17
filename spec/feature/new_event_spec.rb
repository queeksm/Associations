require 'rails_helper'

RSpec.describe 'New_event', type: :feature do
  before do
    User.create(username: 'tester_user')
    visit 'http://localhost:3000/login'
    fill_in 'username', with: 'tester_user'
    click_on 'Login'
  end

  scenario 'create an event' do
    visit 'http://localhost:3000/events/new'
    fill_in 'Name', with: 'Event1'
    fill_in 'Location', with: 'Here'
    fill_in 'Date', with: '2020-07-20'
    click_on 'Create Event'
    user1 = User.find(1)
    expect(user1.events.first.name).to include('Event1')
  end
end
