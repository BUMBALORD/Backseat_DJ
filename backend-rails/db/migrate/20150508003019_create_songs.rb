class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title    ##Soundcloud outputs weren't helpful
      # t.string :artists
      t.integer :track_id
      t.belongs_to :playlist
      t.integer :skip, default: 0
      t.integer :replay, default: 0

      t.timestamps null: false
    end
  end
end
