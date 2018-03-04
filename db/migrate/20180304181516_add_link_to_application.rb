class AddLinkToApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :link, :string
  end
end
