require 'faker'

FactoryBot.define do
  factory :phase do
    period { Faker::Number.unique.between(1, 5) }
    name { "#{period}th lesson" }
    short { "#{period}th" }
    time = Time.new(2000, 1, 1, 8, 30, 0)
    starttime { time + (period * 2.hours) }
    endtime { starttime + 2.hours }
  end
end
