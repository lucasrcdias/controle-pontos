class CreateFrequency < ActiveRecord::Migration
  def change
    create_table :frequencies do |t|
      t.integer :days, array: true, default: []
      t.belongs_to :company, index: true
    end
  end
end
