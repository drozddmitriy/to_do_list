FactoryBot.define do
  factory :task do
    name { 'Task_test' }
    complete { false }
    project
  end
end
