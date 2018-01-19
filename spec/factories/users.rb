FactoryGirl.define do
  factory :user do
    name "Some Name"
    email "some@email.com"
    moderator false
    creator false
    disactive false
  end
end
