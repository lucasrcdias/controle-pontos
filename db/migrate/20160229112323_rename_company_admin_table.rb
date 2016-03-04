class RenameCompanyAdminTable < ActiveRecord::Migration
  def change
    rename_table :company_admins, :company_users
  end
end
