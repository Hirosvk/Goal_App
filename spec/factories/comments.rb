FactoryGirl.define do
  factory :comment do
    body "MyText"
    commentable_id ""
    commentable_type "MyString"
  end
end
