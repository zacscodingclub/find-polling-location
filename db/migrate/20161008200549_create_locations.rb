class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.text :name
      t.text :street
      t.text :cityStateZip
      t.datetime :date
      t.text :hours
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
