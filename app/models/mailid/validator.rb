module Mailid
  class Validator
    attr_accessor :error_messages

    def initialize(conversation, message, receipts)  
      @conversation = conversation
      @message = message
      @receipts = receipts
    end

    def validate!
      errors = {}
      errors[:conversation] = @conversation.errors unless @conversation.valid?
      errors[:message] = @message.errors unless @message.valid?
      receipts = []
      @receipts.each { |receipt| receipts << receipt.errors unless receipt.valid? }
      errors[:receipts] = receipts if receipts.any?
      self.error_messages = errors
    end

    def valid?
      validate!
      !error_messages.any?
    end

    def objects_with_errors
      {
        conversation: @conversation,
        message: @message,
        receipts: @receipts
      }
    end
  end
end
