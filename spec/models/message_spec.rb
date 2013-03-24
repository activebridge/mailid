require 'spec_helper'

describe Message do
  let(:message) { FactoryGirl.create(:message) }

  context 'associations' do
    it { should have_many(:receipts) }
    it { should belong_to(:conversation) }
  end

  context 'delegate' do
     it "should be method subject" do
       expect(message.subject).to be_present
     end
  end

  context 'validation' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:created_at) }

    it "should not be valid without name" do
      message.body = ''
      expect(message).not_to be_valid
    end

    it "should not be valid without created_at" do
      message.created_at = ''
      expect(message).not_to be_valid
    end
  end
end
