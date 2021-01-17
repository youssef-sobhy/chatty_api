require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'Associations' do
    it { should have_many(:chats).dependent(:destroy) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:token) }
  end
end
