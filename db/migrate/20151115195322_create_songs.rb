class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :track_name
      t.string :preview
      t.string :art_work
      t.string :genre

      t.timestamps null: false
    end
  end
end
