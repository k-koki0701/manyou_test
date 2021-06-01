class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 30 }
  validates :task_detail, presence: true
  scope :search_task_name, ->(task_name) { where(['task_name LIKE ?', task_name]) }
  scope :search_status, ->(status) { where(status: status) }
end
