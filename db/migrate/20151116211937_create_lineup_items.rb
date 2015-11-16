class CreateLineupItems < ActiveRecord::Migration
  def change
    create_table :lineup_items do |t|
      t.references :player, index: true
      t.references :lineup, index: true
      t.decimal :unit_cost
      t.integer :quantity

      t.timestamps null: false
    end
    add_foreign_key :lineup_items, :players
    add_foreign_key :lineup_items, :lineups
  end
end
