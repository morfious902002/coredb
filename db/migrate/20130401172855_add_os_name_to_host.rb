class AddOsNameToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :osName, :string
  end
end
