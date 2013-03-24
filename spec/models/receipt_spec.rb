require 'spec_helper'

describe Receipt do
  let(:receipt) { FactoryGirl.create(:receipt) }

  context 'associations' do
    it { should belong_to(:message) }
    it { should belong_to(:user) }
  end

  context 'validation' do
    it { should validate_presence_of(:message_type) }
    it { should validate_presence_of(:read) }
    it { should validate_presence_of(:trashed) }
  end
end
