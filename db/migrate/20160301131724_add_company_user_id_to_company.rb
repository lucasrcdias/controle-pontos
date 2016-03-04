class AddCompanyUserIdToCompany < ActiveRecord::Migration
  def change
    change_table :companies do |t|
      t.references :company_user, index: true, foreign_key: true
    end
  end
end
