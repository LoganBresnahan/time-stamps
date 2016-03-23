class CreateStamps < ActiveRecord::Migration
  def change
    create_table :stamps do |t|
      t.string :time
      t.string :body
      t.integer :note_id, null: false

      t.timestamps null: false
    end
  end
end
