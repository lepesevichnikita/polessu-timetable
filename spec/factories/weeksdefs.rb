require 'faker'

FactoryBot.define do
  factory :weeksdef do
    short { Faker::Number.between(1, 20)}
    name { "#{short+1} нед." }
  end
end