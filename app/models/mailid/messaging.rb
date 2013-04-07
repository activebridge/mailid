module Mailid
  module Messaging

    def send_message(conversation, data)
      message = Message.new(data[:message])
      message.conversation = conversation
      data[:receipts].each do |receipt|
        receipt[:user].conversations << conversation
      end
      receipts = deliver({ receipts: data[:receipts],
                           message: message,
                           conversation: conversation })
      validator = Validator.new(conversation, message, receipts)
      if validator.valid?
        receipts.each(&:save)
        message.save
        conversation.save
        conversation
      else
        validator
      end
    end

    def reply(conversation, recipients, subject, message_params)
      recipients = conversation.last_message.sender
      recipients = recipients.kind_of?(Array) ? recipients : [recipients]
      data = DataCollector.new(recipients, "Re: #{ conversation.subject }", message_params).pick(self)
      conversation.recipients = recipients if recipients.any?
      send_message(conversation, data)
    end

    def create_conversation(recipients, subject, message_params)
      data = DataCollector.new(recipients, subject, message_params).pick(self)
      conversation = Conversation.new(data[:conversation])
      conversation.recipients = recipients if recipients.any?
      send_message(conversation, data)
    end

    def deliver(opt = {})
      receipts = []
      opt[:receipts].each do |receipt|
        r = Receipt.new(receipt)
        r.message = opt[:message]
        receipts << r
      end
      receipts
    end
  end
end
