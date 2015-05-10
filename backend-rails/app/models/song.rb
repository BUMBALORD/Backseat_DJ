class Song < ActiveRecord::Base
	belongs_to :playlist
  validates :track_id, uniqueness: true
end
