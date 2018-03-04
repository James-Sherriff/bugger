class AddCurrentUrlToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :current_url, :string
  end
end
