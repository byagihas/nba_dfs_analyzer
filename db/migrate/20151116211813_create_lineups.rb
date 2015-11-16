class CreateLineups < ActiveRecord::Migration
  def change
    create_table :lineups do |t|
      t.decimal :totalavg
      t.decimal :avgmin
      t.integer :totalcost
      t.decimal :totalassists
      t.decimal :totalrebs
      t.decimal :totalsteals

      t.timestamps null: false
    end
  end
end
