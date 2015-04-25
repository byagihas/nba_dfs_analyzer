class AddCost < ActiveRecord::Migration
  def change
    add_column :nbaplayers, :cost, :integer
  end
end
