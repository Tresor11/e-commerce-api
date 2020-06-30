# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    name { Faker::Lorem.word }
    description { Faker::Lorem.word }
    price { Faker::Number.number(10) }
  end
end
