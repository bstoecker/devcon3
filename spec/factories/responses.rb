# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :response do
    content { Faker::Lorem.sentence((1..10).to_a.sample) }
  end
end
