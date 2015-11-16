class CreateLineUpStatuses < ActiveRecord::Migration
  def change
    create_table :line_up_statuses do |t|

      t.timestamps null: false
    end
  end
end
