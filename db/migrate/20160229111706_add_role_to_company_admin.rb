class AddRoleToCompanyAdmin < ActiveRecord::Migration
  def change
    change_table :company_admins do |t|
      t.integer :role
    end
  end
end
