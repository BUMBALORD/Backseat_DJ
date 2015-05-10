class Playlist < ActiveRecord::Base
	belongs_to :user
	has_many :songs, dependent: :destroy  # if playlist is deleted so are its songs

end
