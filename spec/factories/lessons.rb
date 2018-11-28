require 'faker'

FactoryBot.define do
  factory :lesson do
    subject

    before :create do |lesson|
      days_num = Faker::Number.between(1, 6)
      weeks_num = Faker::Number.between(1, 20)
      params = {
          daysdef: first_or_create(Daysdef, short: days_num),
          weeksdef: first_or_create(Weeksdef, short: weeks_num),
          termsdef: first_or_create(Termsdef)
      }
      lesson.set(params)
    end

    periodspercard { Faker::Number.decimal(1, 1) }
    periodsperweek { Faker::Number.decimal(1, 1) }
    seminargroup { '*' }

    after :create do |lesson|
      groups = create_list(:group, 5)
      parts = groups.map(&:parts).flatten
      attributes = {
        groups: groups,
        parts: parts,
        teachers: create_list(:teacher, 3),
        classrooms: create_list(:classroom, 3)
      }
      lesson.update_attributes(attributes)
      lesson
    end
  end
end
