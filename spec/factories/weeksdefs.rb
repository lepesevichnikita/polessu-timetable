require 'faker'

FactoryBot.define do
  factory :weeksdef do
    short { Faker::Number.between(1, 21) }
    name { "#{short} нед." }
    weeks { CardsRepositoryHelper.number_as_string(short.to_i-1) }
  end
end