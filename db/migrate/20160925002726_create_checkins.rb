class CreateCheckins < ActiveRecord::Migration[5.0]
  def change
    create_table :checkins do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :address
      t.datetime :start
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
