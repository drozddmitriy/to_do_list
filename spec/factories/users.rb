FactoryBot.define do
  factory :user do
    username { FFaker::Lorem.word }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
