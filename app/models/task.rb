class Task < ApplicationRecord
  belongs_to :user
  validates :task_name, presence: true, length: { maximum: 30 }
  validates :task_detail, presence: true
  validates :priority, presence: true
  validates :status, presence: true
  scope :search_task_name, ->(task_name) { where(['task_name LIKE ?', task_name]) }
  scope :search_status, ->(status) { where(status: status) }
  enum priority: { 高: 0, 中: 1, 低: 2 }
end
