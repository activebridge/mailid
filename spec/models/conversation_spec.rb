require 'spec_helper'

describe Conversation do
  let(:conversation) { FactoryGirl.create(:conversation) }
  let(:message) { FactoryGirl.create(:message) }
  let(:sender_receipt) { FactoryGirl.create(:receipt, message_type: 'inbox') }
  let(:recipient_receipt) { FactoryGirl.create(:receipt, message_type: 'sentbox') }
  let(:conversation_data) do
    {
      body:     'body',
      subject:  'subject'
    }
  end

  context 'associations' do
    it { should have_many(:messages) }
  end

  context 'validations' do
    it "should be valid" do
      expect(conversation.valid?).to be_true
    end

    it "should has error with subject" do
      conversation.subject = nil
      conversation.valid?
      expect(conversation.errors).not_to be_empty
    end
  end

  context 'last_message' do
    it 'should return last message of conversation' do
      conversation.messages << message
      expect(conversation.last_message).to eq(message)
    end
  end
end
