FactoryGirl.define do
  sequence :title do |n|
    "Do it quickly #{n}"
  end
  factory :task do
    title
    association :user
    due_at "2013-09-21 10:00:00"
    priority 1
    completed false
  end
end