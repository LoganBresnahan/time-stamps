class ChangeUrlColumnNameToLink < ActiveRecord::Migration
  def change
    rename_column :videos, :url, :link
  end
end
