class AddColumnsToLineup < ActiveRecord::Migration
  def up
    remove_column :lineup_items, :player_id
    remove_column :lineup_items, :position
    add_column :lineup_items, :pg1, :integer
    add_column :lineup_items, :pg2, :integer
    add_column :lineup_items, :sg1, :integer
    add_column :lineup_items, :sg2, :integer
    add_column :lineup_items, :sf1, :integer
    add_column :lineup_items, :sf2, :integer
    add_column :lineup_items, :pf1, :integer
    add_column :lineup_items, :pf2, :integer
    add_column :lineup_items, :cen, :integer
  end
  def down
    add_column :lineup_items, :cen, :integer
    add_column :lineup_items, :pf2, :integer
    add_column :lineup_items, :pf1, :integer
    add_column :lineup_items, :sf2, :integer
    add_column :lineup_items, :sf1, :integer
    add_column :lineup_items, :sg2, :integer
    add_column :lineup_items, :sg1, :integer
    add_column :lineup_items, :pg2, :integer
    add_column :lineup_items, :pg1, :integer
    remove_column :lineup_items, :position
    remove_column :lineup_items, :player_id

  end
end
