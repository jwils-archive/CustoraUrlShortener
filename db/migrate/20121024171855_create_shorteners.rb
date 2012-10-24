class CreateShorteners < ActiveRecord::Migration
  def change
    create_table :shorteners  do |t|
      t.string :url
      t.fixed_binary :hash, limit => 8
      t.string :password_hash
      t.timestamps
    end
  end
end
