require 'faker'

FactoryBot.define do
  factory :classroom do
    short do
      corp = Faker::Number.between(1, 3) * 1000
      stair = Faker::Number.between(1, 7) * 100
      start_room = corp + stair + 1
      end_room = corp + stair + 30
      Faker::Number.between(start_room, end_room)
    end
    name  { "#{short} aud." }
    capacity { Faker::Number.between(30, 200) }
  end
end
