class RenameUrlKeyToUrlString < ActiveRecord::Migration[7.0]
  def change
    rename_column :urls, :url_key, :url_string
  end
end
