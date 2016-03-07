class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.time :start_at
      t.time :finish_at
      t.time :interval
      t.belongs_to :company, index: true

      t.timestamps null: false
    end
  end
end
