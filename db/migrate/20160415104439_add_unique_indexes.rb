class AddUniqueIndexes < ActiveRecord::Migration
  def change
    add_index :frequencies, :days, unique: true
    add_index :roles,       :name, unique: true
  end
end
