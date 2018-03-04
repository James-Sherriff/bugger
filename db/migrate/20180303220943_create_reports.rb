class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :application_id
      t.string :description
      t.string :screenshot_base64
      t.timestamps
    end
  end
end
