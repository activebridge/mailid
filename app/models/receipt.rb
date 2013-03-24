class Receipt
  include Mongoid::Document

  field :message_type, type: String
  field :read, type: Boolean
  field :trashed, type: Boolean
  field :deleted, type: Boolean
  field :created_at, type: DateTime
  field :message_id, type: Integer

  validates :message_type, :read, :trashed, presence: true

  belongs_to :message
  belongs_to :user

  delegate :conversation, to: :message

  scope :sentbox, where(message_type: "sentbox")
  scope :inbox, where(message_type: "inbox")
  scope :unread, where(read: false)
end
