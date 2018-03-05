class ChangeScreenshotLength < ActiveRecord::Migration[5.1]
  def change
    change_column :reports, :screenshot_base64, :text, :limit => 128.kilobytes
  end
end
