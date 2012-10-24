class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.references :shortener
      t.string :ip_address

      t.timestamps
    end
    add_index :clicks, :shortener_id
  end
end
