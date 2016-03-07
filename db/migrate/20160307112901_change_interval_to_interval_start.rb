class ChangeIntervalToIntervalStart < ActiveRecord::Migration
  def change
    remove_column :periods, :interval, :time
    add_column :periods, :interval_start, :time
  end
end
