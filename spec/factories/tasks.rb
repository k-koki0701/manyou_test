FactoryBot.define do
  factory :task do
    task_name { 'task' }
    task_detail { 'task' }
  end
  factory :second_task, class: Task do
    task_name {'task2'}
    task_detail {'task2'}
  end
end
