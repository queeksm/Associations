require 'rails_helper'

RSpec.describe User, type: :model do
  context 'context' do
    it 'is not valid' do
      user = User.create(username: '')
      expect(user.errors.key?(:username)).to be true
    end

    it 'is unique' do
      User.create(username: 'tester_user')
      user2 = User.create(username: 'tester_user')
      expect(user2.errors.key?(:username)).to be true
    end
  end
end
