class CreateMlbplayers < ActiveRecord::Migration
  def change
    create_table :mlbplayers do |t|
      t.string :name
      t.string :team
      t.string :position
      t.string :battingpos
      t.string :salary
      t.float :avgpoints
      t.float :value

      t.timestamps null: false
    end
  end
end
