class AddExtraHourLimitToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :extra_hours_limit, :time
  end
end
