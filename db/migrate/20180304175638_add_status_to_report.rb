class AddStatusToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :status, :integer, {default: 0}
  end
end
