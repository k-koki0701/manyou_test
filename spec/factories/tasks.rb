FactoryBot.define do
  factory :task do
    task_name { 'task' }
    task_detail { 'task' }
    end_period { Date.today }
    status {'未着手'}
    priority {'高'}
    user
  end
  factory :second_task, class: Task do
    task_name {'task2'}
    task_detail {'task2'}
    end_period { Date.today - 1 }
    status {'完了'}
    priority {'中'}
    user
  end
end
