class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :critical
      t.string :PBContactName
      t.string :PBContactNetID
      t.integer :PBContactPhone
      t.string :PTContactName
      t.string :PTContactNetID
      t.integer :PTContactPhone
      t.string :STContactName
      t.string :STContactNetID
      t.integer :STContactPhone

      t.timestamps
    end
  end
end
