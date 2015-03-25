# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :status do
    content { Faker::Lorem.sentence((1..3).to_a.sample) }
  end
end
