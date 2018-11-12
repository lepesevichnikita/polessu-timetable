require 'faker'

FactoryBot.define do
  factory :classroom do
    short { Faker::Number.between(100, 3999) }
    name  { "#{short} aud." }
    capacity { Faker::Number.between(30, 200) }
  end
end