FactoryBot.define do
  factory :comment do
    association :review

    comment_text{ Faker::Lorem.characters(number: 100)}
    
  end
end
