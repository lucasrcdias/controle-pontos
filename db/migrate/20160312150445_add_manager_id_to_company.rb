class AddManagerIdToCompany < ActiveRecord::Migration
  def change
    change_table :companies do |t|
      t.belongs_to :manager, index: true, foreign_key: true
    end
  end
end
