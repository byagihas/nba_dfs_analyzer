class ChangeAttribute < ActiveRecord::Migration
  def change
    remove_column :nbaplayers, :is_starting_lineup, :boolean
    remove_column :nbaplayers, :avgpoints, :integer
    add_column :nbaplayers, :cost, :integer
    add_column :nbaplayers, :avgpoints, :float
  end
end
