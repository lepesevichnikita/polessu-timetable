require 'faker'

FactoryBot.define do
  factory :card do
    period
    daysdef
    weeksdef
    termsdef
    lesson

    after :create do |card|
      card.classrooms << create_list(:classrooms, 3)
    end
  end
end
