FactoryBot.define do
  factory :comment do
    text { 'Comment_test_text' }
    file { File.open(File.join(Rails.root, 'public/test.jpg')) }
    task
  end
end
