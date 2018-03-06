class CreateReportUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :report_updates do |t|
      t.text :description
      t.timestamps
    end
  end
end
