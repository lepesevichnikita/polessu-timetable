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
      create_list(:group, 5).each { |group| lesson.groups << group }
      lesson.groups.each { |gr| lesson.parts << gr.parts }
      create_list(:teacher, 3).each { |teacher| lesson.teachers << teacher }
      create_list(:classroom, 3).each { |classroom| lesson.classrooms << classroom }
    end
  end
end