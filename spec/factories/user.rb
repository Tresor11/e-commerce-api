# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'test@gail.com' }
    password { 'foobar' }
  end
end
