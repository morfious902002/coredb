class AddBitToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :bit, :integer
  end
end
