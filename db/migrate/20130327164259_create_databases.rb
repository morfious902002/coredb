class CreateDatabases < ActiveRecord::Migration
  def change
    create_table :databases do |t|
      t.string :name
      t.integer :host_id
      t.integer :primary_dba_id
      t.integer :secondary_dba_id
      t.integer :port
      t.integer :server_id
      t.string :drmethod
      t.timestamp :dbcreated_on
      t.string :version
      t.string :unique_hash
      t.string :server_desc

      t.timestamps
    end
  end
end
