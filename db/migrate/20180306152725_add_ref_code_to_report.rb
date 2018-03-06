class AddRefCodeToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :ref_code, :string
  end
end
