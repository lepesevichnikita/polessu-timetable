require 'faker'

FactoryBot.define do
  factory :lesson do
    subject
    daysdef
    weeksdef
    termsdef

    periodspercard { Faker::Number.decimal(1, 1) }
    periodsperweek { Faker::Number.decimal(1, 1) }
    seminargroup { '*' }

    after :create do |lesson|
      groups = create_list(:group, 5)
      lesson.groups = groups
      groups.map { |gr| lesson.parts << gr.parts }
      lesson.teacherids = create_list(:teacher, 3).map(&:id)
      lesson.classroomids = create_list(:classroom, 3).map(&:id)
    end
  end
end