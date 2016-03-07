class AddIntervalFinishToPeriod < ActiveRecord::Migration
  def change
    change_table :periods do |t|
      t.time :interval_finish
    end
  end
end
