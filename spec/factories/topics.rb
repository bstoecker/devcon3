# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    title     { Faker::Lorem.sentence((1..3).to_a.sample) }
    content   { Faker::Lorem.sentence((1..10).to_a.sample) }
    post_type { 'Question' }
  end
end
