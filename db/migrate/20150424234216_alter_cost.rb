class AlterCost < ActiveRecord::Migration
  def up
    connection.execute(%q{
      alter table nbaplayer
      alter column cost
      type integer using cast(cost as integer)
    })
  end
end
