FactoryGirl.define do
  factory :message do
    body 'Message body'
    created_at Time.now
    association :conversation
  end
end
