FactoryBot.define do
  factory :comment do
    text { FFaker::Lorem.phrase }
    file { File.open(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
  end
end
