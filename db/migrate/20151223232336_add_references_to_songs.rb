class AddReferencesToSongs < ActiveRecord::Migration
  def change
    add_reference :songs, :playlist, index: true, foreign_key: true
    add_column :songs, :plays, :integer, default: 0
  end
end
