class AddStatusToReportUpdate < ActiveRecord::Migration[5.1]
  def change
    add_column :report_updates, :status, :integer
  end
end
