require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'Associations' do
    it { should belong_to(:chat) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:body) }
    it { should validate_uniqueness_of(:number).scoped_to(:chat_id) }
  end

  describe 'Delegations' do
    it { should delegate_method(:application).to(:chat) }
  end
end
