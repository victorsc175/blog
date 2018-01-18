FactoryGirl.define do
  factory :comment do
    body "MyText"
    user nil
    post nil
    disactive false
  end
end
