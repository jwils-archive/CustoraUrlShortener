class CreateShorteners < ActiveRecord::Migration
  def change
    create_table :shorteners  do |t|
      t.string :url
      t.string :url_hash, :limit => 8
      t.string :password_hash
      t.timestamps
    end
  end
end
