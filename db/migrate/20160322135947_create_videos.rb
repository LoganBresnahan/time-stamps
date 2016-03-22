class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.integer :note_id

      t.timestamps null: false
    end
  end
end
