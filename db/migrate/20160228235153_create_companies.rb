class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :social_reason
      t.string :fantasy_name
      t.string :cnpj
      t.integer :code

      t.timestamps null: false
    end
  end
end
