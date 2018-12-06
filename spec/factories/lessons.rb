require 'faker'

FactoryBot.define do
  factory :lesson do
    subject

    before :create do |lesson|
      days_num = Faker::Number.between(1, 6)
      weeks_num = Faker::Number.between(1, 20)
      groups = create_list(:group, 5)
      parts = groups.map(&:parts).flatten
      teachers = groups.map(&:teacher).flatten
      attributes = {
          groups: groups,
          parts: parts,
          teachers: teachers,
          classrooms: create_list(:classroom, 3),
          daysdef: first_or_create(Daysdef, short: days_num),
          weeksdef: first_or_create(Weeksdef, short: weeks_num),
          termsdef: first_or_create(Termsdef)
      }
      lesson.set(attributes)
    end

    periodspercard { Faker::Number.decimal(1, 1) }
    periodsperweek { Faker::Number.decimal(1, 1) }
    seminargroup { '*' }

  end
end
