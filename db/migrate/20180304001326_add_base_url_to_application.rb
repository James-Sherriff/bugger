class AddBaseUrlToApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :base_url, :string
  end
end
