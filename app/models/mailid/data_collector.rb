module Mailid
  class DataCollector
    def initialize(recipients, subject, message_params)
      @recipients = recipients
      @subject = subject
      @message_params = message_params
    end

    def pick(sender)
      receipts = []
      creation_time = Time.now
      receipts << { message_type: 'sentbox',
                    read: true,
                    created_at: creation_time,
                    user: sender }
      @recipients.each do |recipient|
        receipts << { message_type: 'inbox',
                      read: false,
                      created_at: creation_time,
                      user: recipient }
      end
      {
        conversation: {
          subject: @subject,
          created_at: creation_time,
        },
        message: {
          body: @message_params[:body],
          created_at: creation_time,
        },
        receipts: receipts
      }
    end
  end
end
