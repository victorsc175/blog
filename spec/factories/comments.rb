FactoryGirl.define do
  factory :comment do
    body "MyText"
    user nil
    commentable nil
    disactive false
  end
end
