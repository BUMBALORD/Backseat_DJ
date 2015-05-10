class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title    ##Soundcloud outputs weren't helpful
      # t.string :artists
      t.integer :track_id
      t.belongs_to :playlist

      t.timestamps null: false
    end
  end
end
