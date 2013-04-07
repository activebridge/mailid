class TrashedConversation
  include Mongoid::Document

  field :conversation_id, type: Integer
  field :user_id, type: Integer

  belongs_to :conversation
  belongs_to :user

  scope :trashed_for, ->(user) { where(user: user) }
end
