class CreateTimeStamps < ActiveRecord::Migration
  def change
    create_table :time_stamps do |t|
      t.string :stamp
      t.string :body
      t.integer :note_id, null: false

      t.timestamps null: false
    end
  end
end
