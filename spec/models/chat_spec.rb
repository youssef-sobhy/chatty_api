require 'rails_helper'

RSpec.describe Chat, type: :model do
  describe 'Associations' do
    it { should have_many(:messages).dependent(:destroy) }
    it { should belong_to(:application) }
  end

  describe 'Validations' do
    it { should validate_uniqueness_of(:number).scoped_to(:application_id) }
  end

  # describe 'Scopes' do

  # end
end
