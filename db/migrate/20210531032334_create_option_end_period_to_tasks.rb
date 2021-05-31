class CreateOptionEndPeriodToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :end_period, null: false
  end
end
