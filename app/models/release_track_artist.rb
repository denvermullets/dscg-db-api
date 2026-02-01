class ReleaseTrackArtist < ApplicationRecord
  self.table_name = 'release_track_artist'

  belongs_to :release
  belongs_to :release_track, foreign_key: :track_id, primary_key: :track_id
  belongs_to :artist
end
