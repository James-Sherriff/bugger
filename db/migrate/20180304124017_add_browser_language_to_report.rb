class AddBrowserLanguageToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :browser_language, :string
  end
end
