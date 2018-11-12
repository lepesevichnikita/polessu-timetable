require 'faker'

FactoryBot.define do
  factory :grade do
    grade { Faker::Number.between(1, 20) }
    name { "Параллель #{grade}" }
    short { "Парал. #{grade}" }
  end
end
