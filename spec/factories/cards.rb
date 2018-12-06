require 'faker'

FactoryBot.define do
  factory :card do
    lesson

    after :create do |card|
      card.update_attributes(classrooms: card.lesson.classrooms)
    end

    before :create do |card|
      period_num = Faker::Number.between(1, 5)
      attributes = {
          number: first_or_create(Period, period: period_num,
                                  short: "#{period_num}th").number,
          terms: first_or_create(Termsdef).terms
      }
      card.set(attributes)
    end

    trait :random_day do
      before :create do |card|
        days_num = Faker::Number.between(1, 6)
        weeks_num = Faker::Number.between(1, 20)
        attributes = {
          daysdef: first_or_create(Daysdef, short: days_num),
          weeksdef: first_or_create(Weeksdef, short: weeks_num)
        }
        card.set(attributes)
      end
    end

    trait :today do
      before :create do |card|
        update_days_and_weeks_for(card, Date.today)
      end
    end

    trait :tomorrow do
      before :create do |card|
        update_days_and_weeks_for(card, Date.tomorrow)
      end
    end

    trait :this_week do
      before :create do |card|
        update_days_and_weeks_for(card, Date.today)
      end
    end

    trait :next_week do
      before :create do |card|
        update_days_and_weeks_for(card, Date.today + 1.week)
      end
    end
  end
end
