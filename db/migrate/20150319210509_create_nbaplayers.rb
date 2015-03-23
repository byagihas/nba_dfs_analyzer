class CreateNbaplayers < ActiveRecord::Migration
  def change
    create_table :nbaplayers do |t|
      t.text :name
      t.text :position
      t.text :team
      t.integer :avgfanduelpoints
      t.boolean :is_starting_lineup
      t.timestamps null: false
    end
  end
end

class ChangePositionType < ActiveRecord::Migration
  def up
    change column :nbaplayers, :position,
  end
  def down
  end
end
