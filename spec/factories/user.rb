FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'test@gail.com' }
    password { 'foobar' }
    password_confirmation { 'foobar' }
    trait :admin do
      admin { true }
      email { 'a@gmail.com' }
    end
    image { File.open(File.join(Rails.root, '/spec/support/kid.jpg')) }
  end
end
