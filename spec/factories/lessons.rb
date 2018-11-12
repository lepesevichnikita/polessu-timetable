require 'faker'

FactoryBot.define do
  factory :lesson do
    subject
    daysdef
    weeksdef
    termsdef

    periodspercard { Faker::Numnber.decimal(1, 1) }
    periodsperweek { Faker::Number.decimal(1, 1) }
    seminargroup { '*' }

    groups
    parts
    teachers
    classrooms
  end
end