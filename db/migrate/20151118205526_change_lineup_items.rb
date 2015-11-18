class ChangeLineupItems < ActiveRecord::Migration
  def change
    remove_column :lineup_items, :unit_cost
    add_column :lineup_items, :cost, :integer
    add_column :lineup_items,:avgpoints, :float
    add_column :lineup_items,:position, :string
    add_column :lineup_items,:name, :text
    add_column :lineup_items,:team, :text
  end
end
