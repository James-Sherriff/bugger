class AddPriorityToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :priority, :integer
  end
end
