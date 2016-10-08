class User < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :current_location
      t.text :input_location
      t.text :gps_location
    end
  end
end
