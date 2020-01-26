FactoryBot.define do
  factory :user do
    username { FFaker::Name.first_name }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
