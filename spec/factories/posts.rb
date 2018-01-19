FactoryGirl.define do
  factory :post do
    title "Title"
    body "Text Body"
    user nil
    disactive false
  end
end
