require 'faker'

FactoryBot.define do
  factory :termsdef do
    short { 'три недели' }
    terms { 1 }
    name { '3 нед.' }
  end
end