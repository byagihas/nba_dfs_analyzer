class AddLinepositionToLineupItems < ActiveRecord::Migration
  def up
    add_column :lineup_items, :lineuposition, :string
  end
  def down
    remove_column :lineup_items, :lineuposition, :string
  end
end
