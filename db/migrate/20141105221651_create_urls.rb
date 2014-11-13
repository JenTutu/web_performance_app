class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :given_url
      t.float :page_load_time
      t.integer :num_of_links 
      t.timestamps
    end
  end
end
