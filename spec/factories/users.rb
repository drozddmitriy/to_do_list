FactoryBot.define do
  factory :user do
    username { FFaker::Unit.temperature_name }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
