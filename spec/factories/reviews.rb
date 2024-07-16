FactoryBot.define do
  factory :review do
    association :user

    title{ Faker::Book.title }
    author { Faker::Book.author }
    genre_id { Faker::Number.between(from: 1, to: 9) }
    tag { Faker::Lorem.characters(number: 20) }
    evaluation_id { Faker::Number.between(from: 1, to: 5) }
    impression { Faker::Lorem.paragraph(sentence_count: 3) } 
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
