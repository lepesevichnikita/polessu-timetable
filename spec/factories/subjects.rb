require 'faker'

FactoryBot.define do
  factory :subject do
    name { Faker::FunyName.name }
    short { Faker::FunyName.name }
  end
end