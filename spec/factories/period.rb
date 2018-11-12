require 'faker'

FactoryBot.define do
  factory :period do
    number = Faker::Number.between(1, 5)
    period { number }
    name { "#{number}th lesson" }
    short { "#{number}th" }
    time = Time.new(2000, 1, 1, 8, 30, 0)
    stime = time + (number * 2.hours)
    etime = stime + 2.hours
    starttime { stime }
    endtime { etime }
  end
end
