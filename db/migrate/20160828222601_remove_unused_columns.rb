class RemoveUnusedColumns < ActiveRecord::Migration
  def change
    remove_column :workers, :code
    remove_column :companies, :code
  end
end
