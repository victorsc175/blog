FactoryGirl.define do
  factory :post do
    title 'Title1'
    body 'Text Body1'
    user
    disactive false
  end
end
