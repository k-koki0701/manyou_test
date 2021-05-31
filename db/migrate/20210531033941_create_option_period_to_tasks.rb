class CreateOptionPeriodToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :end_period, :datetime
  end
end
