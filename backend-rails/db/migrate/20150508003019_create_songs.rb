class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :sc_id            # Soundcloud ID -- might be integer and not string????
      t.belongs_to :playlist

      t.timestamps null: false
    end
  end
end
