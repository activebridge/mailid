class Message
  include Mongoid::Document

  field :body, type: String
  field :created_at, type: DateTime
  field :conversation_id, type: Integer

  has_many :receipts, dependent: :delete
  belongs_to :conversation

  delegate :subject, to: :conversation

  validates :body, :created_at, presence: true
  validates :receipts, associated: true

  def sender
    receipts.where(message_type: 'sentbox').first.user
  end
end
