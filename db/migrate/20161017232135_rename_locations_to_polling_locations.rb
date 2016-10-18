class RenameLocationsToPollingLocations < ActiveRecord::Migration[5.0]
  def change
    rename_table :locations, :polling_locations
  end
end
