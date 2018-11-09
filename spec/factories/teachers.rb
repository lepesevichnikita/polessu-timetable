require 'faker'

FactoryBot.define do
  factory :teacher do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    midlle_name = Faker::Name.middle_name
    name { "#{lastname} #{firstname} #{midlle_name}" }
    short { "#{lastname} #{firstname[0]}.#{midlle_name[0]}." }
    gender { Faker::Gender.binary_type[0] }
    color { Faker::Color.hex_color }
    email { Faker::Internet.email }
    mobile { Faker::PhoneNumber.phone_number }
  end
end
