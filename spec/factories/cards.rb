require 'faker'

FactoryBot.define do
  factory :card do
    period
    daysdef
    weeksdef
    termsdef
    lesson

    after :create do |card|
      card.classrooms = card.lesson.classrooms
    end
  end
end
