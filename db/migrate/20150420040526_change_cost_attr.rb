class ChangeCostAttr < ActiveRecord::Migration
  def change
    change_column :nbaplayers, :cost, :string
  end
end
