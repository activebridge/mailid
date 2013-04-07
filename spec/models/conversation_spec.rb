require 'spec_helper'

describe Conversation do
  let(:user) { FactoryGirl.create(:user) }
  let(:friend) { FactoryGirl.create(:user) }
  let(:conversation) { FactoryGirl.create(:conversation, recipients: [user, friend]) }
  let(:message) { FactoryGirl.create(:message, conversation: conversation) }
  let(:sender_receipt) { FactoryGirl.create(:receipt, message_type: 'inbox', user: user, message: message) }
  let(:receiver_receipt) { FactoryGirl.create(:receipt, message_type: 'sentbox', user: friend, message: message) }
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

    it 'should has a conversation creator' do
      message.receipts << sender_receipt
      message.receipts << receiver_receipt
      conversation.messages << message
      expect(conversation.creator).to eq(friend)
    end
  end
end
