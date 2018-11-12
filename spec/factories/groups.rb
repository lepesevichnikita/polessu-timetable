require 'faker'

FactoryBot.define do 
  factory :group do
    teacher
    grade

    name { Faker::NatoPhoneticAlphabet.code_word }
    short { "#{name} (#{Faker::Number.between(10, 30)})" }

    after :create do |group|
      create(:part, group: group)
      create(:part_of_boys, group: group)
      create(:part_of_girls, group: group)
      create(:part_subpart_first, group: group)
      create(:part_subpart_second, group: group)
      create(:part_other_first, group: group)
      create(:part_other_second, group: group)
      create(:part_other_third, group: group)
    end
  end
end