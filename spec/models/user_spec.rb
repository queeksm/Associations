require 'rails_helper'

RSpec.describe User, type: :model do
  context 'context' do
    it 'is not valid' do
      user = User.create(username: '')
      expect(user.errors.has_key?(:username)).to be true
    end

    it 'is unique' do
      user = User.create(username: 'tester_user')
      user2 = User.create(username: 'tester_user')
      expect(user2.errors.has_key?(:username)).to be true
    end
  end
end