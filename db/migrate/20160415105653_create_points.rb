class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.datetime :date
      t.float    :latitude
      t.float    :longitude

      t.belongs_to :worker, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
