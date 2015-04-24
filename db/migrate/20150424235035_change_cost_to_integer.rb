class ChangeCostToInteger < ActiveRecord::Migration
  def change
    change_column :nbaplayers, :cost, :integer
  end
end
