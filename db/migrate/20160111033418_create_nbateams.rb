class CreateNbateams < ActiveRecord::Migration
  def change
    create_table :nbateams do |t|

      t.timestamps null: false
    end
  end
end
