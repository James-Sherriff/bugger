class AddUrlIdentifierToApplication < ActiveRecord::Migration[5.1]
  def change
    remove_column :applications, :base_url
    add_column :applications, :url_identifier, :string
  end
end
