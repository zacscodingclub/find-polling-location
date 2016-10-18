class AddUidToPollingLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :polling_locations, :uid, :integer
  end
end
