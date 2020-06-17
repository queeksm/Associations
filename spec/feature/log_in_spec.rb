require 'rails_helper'

RSpec.describe 'log_in', type: :feature do
  before {
    user = User.create(username: 'tester_user')
  }

  scenario 'log_in valid' do
    visit 'http://localhost:3000/login'
    fill_in 'username', with: 'tester_user'
    click_on 'Login'
    expect(page).to have_content('Logged in as')
  end

  scenario 'log_in invalid' do
    visit 'http://localhost:3000/login'
    fill_in 'username', with: 'tester_wrong'
    click_on 'Login'
    expect(page).to have_content('Username invalid')
  end
end