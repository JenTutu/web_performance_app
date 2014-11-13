class AddStatusToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :status, :string
  end
end
