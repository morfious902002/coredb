class AddVirtualIpColumnToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :virtualIP, :string
  end
end
