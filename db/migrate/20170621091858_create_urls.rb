class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :short_url, limit: 50
      t.string :url

      t.timestamps null: false
    end
  end
end
