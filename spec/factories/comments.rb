FactoryBot.define do
  factory :comment do
    text { FFaker::Lorem.phrase }
  end
end
