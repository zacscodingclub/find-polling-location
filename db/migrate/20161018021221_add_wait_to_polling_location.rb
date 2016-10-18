class AddWaitToPollingLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :polling_locations, :wait, :string
  end
end
