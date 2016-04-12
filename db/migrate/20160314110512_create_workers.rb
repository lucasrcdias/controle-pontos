class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.integer :internal_id
      t.integer :kind
      t.integer :code
      t.string :document
      t.datetime :admitted_at

      t.belongs_to :user,      index: true, foreign_key: true
      t.belongs_to :company,   index: true, foreign_key: true
      t.belongs_to :period,    index: true, foreign_key: true
      t.belongs_to :frequency, index: true, foreign_key: true
      t.belongs_to :role,      index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
