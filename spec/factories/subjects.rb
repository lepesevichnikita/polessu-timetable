require 'faker'

FactoryBot.define do
  factory :subject do
    name { Faker::FunnyName.name }
    short { Faker::FunnyName.name }
  end
end