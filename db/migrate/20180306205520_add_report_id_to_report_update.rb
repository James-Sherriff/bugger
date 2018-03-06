class AddReportIdToReportUpdate < ActiveRecord::Migration[5.1]
  def change
    add_column :report_updates, :report_id, :string
  end
end
