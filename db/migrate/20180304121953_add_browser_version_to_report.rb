class AddBrowserVersionToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :browser_version, :string
  end
end
