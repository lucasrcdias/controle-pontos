class AddKindToPoints < ActiveRecord::Migration
  def change
    add_column :points, :kind, :integer, default: 0
  end
end
