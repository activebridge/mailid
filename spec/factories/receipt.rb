FactoryGirl.define do
  factory :receipt do
    read false
    trashed false
    deleted false
    created_at Time.now
    message_type ''
    association :message
  end
end
