require 'faker'

FactoryBot.define do
  factory :part do
    group

    name { 'Complete group' }
    studentcount { group.short[/\d+/] }
    entireclass { 1 }
    divisiontag { 0 }

    factory :another_part do
      entireclass { 0 }
      studentcount { '' }

      factory :part_by_gender do
        divisiontag { 2 }

        factory :part_of_girls do
          name { 'Girls' }
        end

        factory :part_of_boys do
          name { 'Boys' }
        end
      end

      factory :subpart do
        divisiontag { 1 }

        factory :part_subpart_first do
          name { '1th part' }
        end

        factory :part_subpart_second do
          name { '2th part' }
        end
      end

      factory :part_other do
        divisiontag { 3 }

        factory :part_other_first do
          name { '1th' }
        end

        factory :part_other_second do
          name { '2th' }
        end

        factory :part_other_third do
          name { '3th' }
        end
      end

    end
  end
end
