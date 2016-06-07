FactoryGirl.define do
  factory :goal do
    title "run 2 miles"
    status "Public"
    completion 1

    factory :private_goal do
      title "private goal! stay away!"
      status "Private"
    end

  end
end
