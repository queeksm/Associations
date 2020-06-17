require 'rails_helper'

RSpec.describe 'Attend_event', type: :feature do
  before do
    User.create(username: 'tester_user')
    Event.create(name: 'Event1', location: 'here', date: '2020-06-30', creator_id: '1')
    visit 'http://localhost:3000/login'
    fill_in 'username', with: 'tester_user'
    click_on 'Login'
  end

  scenario 'attend an event' do
    visit 'http://localhost:3000/attend/1'
    user1 = User.find(1)
    expect(user1.attend.first.name).to include('Event1')
  end

  scenario 'try attend same event twice' do
    visit 'http://localhost:3000/attend/1'
    visit 'http://localhost:3000/attend/1'
    expect(page).to have_content('already attending to this event!')
  end
end
