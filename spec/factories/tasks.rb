FactoryBot.define do
  factory :task do
    name { FFaker::Lorem.word }
    complete { false }
  end
end
