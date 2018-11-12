require 'faker'

FactoryBot.define do
  factory :daysdef do
    short { Faker::Number.between(1, 6) }
    name { Date::DAYNAMES[short] }
    days do
      CardsRepositoryHelper.number_as_string(
        short, :days
      )
    end
  end
end
