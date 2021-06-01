class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 30 }
  validates :task_detail, presence: true
  validates :end_period, presence: true
  validates :status, presence: true
end
