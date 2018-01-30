FactoryGirl.define do
  factory :user do
    name 'Some Name'
    password 'specmanager'
    email 'new@email.com'
    moderator false
    creator false
    disactive false
  end
end
