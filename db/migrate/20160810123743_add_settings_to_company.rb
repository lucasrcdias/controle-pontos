class AddSettingsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :latitude, :float
    add_column :companies, :longitude, :float
    add_column :companies, :radius, :float
  end
end
