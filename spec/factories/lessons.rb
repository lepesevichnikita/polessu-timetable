require 'faker'

FactoryBot.define do
  factory :lesson do
    subject

    before :create do |lesson|
      num = Faker::Number.between(1, 6)
      daysdefs = Daysdef.where(days: CardsRepositoryHelper.number_as_string(num.to_i, :days))
      lesson.daysdef = daysdefs.first || create(:daysdef, short: num)

      num = Faker::Number.between(1, 20)
      weeksdefs = Weeksdef.where(weeks: CardsRepositoryHelper.number_as_string(num.to_i))
      lesson.weeksdef = weeksdefs.first || create(:weeksdef, short: num)
      lesson.termsdef = Termsdef.first || create(:termsdef)
    end

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