class CreateCompanyAdmins < ActiveRecord::Migration
  def change
    create_table :company_admins do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
