class AddEndPeriodToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :end_period, :datetime, null: false, default: -> { 'NOW()' }
  end
end
