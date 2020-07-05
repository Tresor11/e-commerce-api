FactoryBot.define do
  factory :admin, class: 'User' do
    name { Faker::Name.name }
    email { 'a@gmail.com' }
    password { 'foobar' }
    admin { true }
    password_confirmation { 'foobar' }
    image { File.open(File.join(Rails.root, '/spec/support/kid.jpg')) }
  end
end
