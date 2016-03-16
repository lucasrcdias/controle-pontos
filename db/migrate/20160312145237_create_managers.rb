class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
