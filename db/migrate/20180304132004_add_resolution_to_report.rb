class AddResolutionToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :browser_resolution, :string
    add_column :reports, :device_resolution, :string
  end
end
