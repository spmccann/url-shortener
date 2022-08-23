class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.text :full_url
      t.string :url_key

      t.timestamps
    end
  end
end
