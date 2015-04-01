class ChangePointsTag < ActiveRecord::Migration
  def change
    remove_column :nbaplayers, :avgfanduelpoints, :integer
    add_column :nbaplayers, :avgpoints, :integer
  end
end
