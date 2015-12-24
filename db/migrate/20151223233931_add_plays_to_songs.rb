class AddPlaysToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :plays, :integer, default: 0
  end
end
