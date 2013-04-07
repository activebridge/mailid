class Conversation
  include Mongoid::Document

  field :subject, type: String
  field :created_at, type: DateTime

  has_and_belongs_to_many :users, class_name: 'User', inverse_of: :conversations
  has_many :messages, dependent: :delete
  has_one :archived_conversation
  has_one :trashed_conversation

  validates :subject, :recipients, presence: true
  validates :messages, associated: true

  alias_method :error_messages, :errors

  attr_reader :user_tokens
  attr_accessor :recipients

  def last_message
    messages.last
  end

  def creator
    messages.first.sender
  end

  def forward_body
    messages.map { |c| "#{c.sender.full_name}: #{c.body}\n" }.join
  end

  def read? user
    unread_receipts(user).blank?
  end

  def read! user
    unread_receipts(user).each { |receipt|
      receipt.update_attribute :read, true
    }
  end

  private

  def unread_receipts user
    (messages.map(&:receipts).flatten) & (user.receipts.inbox.unread)
  end
end
