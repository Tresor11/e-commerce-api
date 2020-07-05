FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'test@gail.com' }
    password { 'foobar' }
    password_confirmation { 'foobar' }
    image { File.open(File.join(Rails.root, '/spec/support/kid.jpg')) }
  end
end
